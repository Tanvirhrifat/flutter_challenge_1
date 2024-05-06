import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/medicine_bloc.dart';
import '../bloc/medicine_event.dart';
import '../bloc/medicine_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> _typeSelection = [true, false, false];
  List<bool> _sortSelection = [true, false];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedicineBloc()..add(const FetchMedicines()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Medicine"),
          backgroundColor: Colors.deepPurple,
        ),
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search by Medicine Name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ToggleButtons(
                isSelected: _typeSelection,
                children: [
                  _createLongToggleButton("Medicine", context),
                  _createLongToggleButton("Generic", context),
                  _createLongToggleButton("Brand", context),
                ],
                onPressed: (index) {
                  setState(() {
                    _typeSelection = [false, false, false];
                    _typeSelection[index] = true;
                  });
                },
                borderRadius: BorderRadius.circular(20),
                fillColor: Colors.deepPurple,
                borderColor: Colors.white,
                selectedBorderColor: Colors.deepPurple,
                selectedColor: Colors.white,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ToggleButtons(
                isSelected: _sortSelection,
                children: [
                  _createWiderToggleButton("A-Z"),
                  _createWiderToggleButton("Z-A"),
                ],
                onPressed: (index) {
                  setState(() {
                    _sortSelection = [false, false];
                    _sortSelection[index] = true;
                  });
                },
                borderRadius: BorderRadius.circular(20),
                fillColor: Colors.deepPurple,
                borderColor: Colors.white,
                selectedBorderColor: Colors.deepPurple,
                selectedColor: Colors.white,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: BlocBuilder<MedicineBloc, MedicineState>(
                builder: (context, state) {
                  if (state is MedicineStateLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is MedicineStateError) {
                    return Center(
                      child: Text("Error: ${state.message}", style: TextStyle(color: Colors.white)),
                    );
                  }

                  if (state is MedicineStateLoaded) {
                    return ListView.builder(
                      itemCount: state.medicines.length,
                      itemBuilder: (context, index) {
                        var medicine = state.medicines[index];
                        return Card(
                          color: Colors.grey[800],
                          child: ListTile(
                            title: Text(
                              medicine['brand_name'],
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              "${medicine['strength']} - ${medicine['company_id']}\nGeneric: ${medicine['generic_id']}",
                              style: TextStyle(color: Colors.white),
                            ),
                            isThreeLine: true,
                          ),
                        );
                      },
                    );
                  }

                  return Center(
                    child: Text("Unexpected State", style: TextStyle(color: Colors.white)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createLongToggleButton(String text, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _createWiderToggleButton(String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
