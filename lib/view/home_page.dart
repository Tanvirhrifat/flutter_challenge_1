import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Repository/medicine_db.dart';
import '../bloc/medicine_bloc.dart';
import '../bloc/medicine_event.dart';
import '../bloc/medicine_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final medicineRepository = MedicineRepository();
  List<bool> _typeSelection = [true, false, false];
  List<bool> _sortSelection = [true, false];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedicineBloc(medicineRepository)..add(const FetchMedicines()),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            Card(
              color: Colors.grey[800],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 20, 6, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 10, 0, 2),
                      child: Text(
                        "Medicine",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search by Medicine Name',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                      child: Divider(
                        color: Colors.grey[600],
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 5, 6, 6),
                      child: ToggleButtons(
                        isSelected: _typeSelection,
                        children: [
                          createTypeSelectionButton("Medicine", context, 0),
                          createTypeSelectionButton("Generic", context, 1),
                          createTypeSelectionButton("Brand", context, 2),
                        ],
                        onPressed: (index) {
                          setState(() {
                            _typeSelection = [false, false, false];
                            _typeSelection[index] = true;
                          });
                        },
                        borderRadius: BorderRadius.circular(5),
                        borderColor: Colors.black,
                        selectedBorderColor: Colors.deepPurple,
                        selectedColor: Colors.white,
                        fillColor: Colors.transparent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                      child: Divider(
                        color: Colors.grey[600],
                        thickness: 1,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: ToggleButtons(
                        isSelected: _sortSelection,
                        children: [
                          createSortingButton("A to Z", 0),
                          createSortingButton("Z to A", 1),
                        ],
                        onPressed: (index) {
                          setState(() {
                            _sortSelection = [false, false];
                            _sortSelection[index] = true;
                          });
                        },
                        borderRadius: BorderRadius.circular(20),
                        borderColor: Colors.black,
                        selectedBorderColor: Colors.deepPurple,
                        selectedColor: Colors.white,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: state.medicines.length,
                      itemBuilder: (context, index) {
                        var medicine = state.medicines[index];
                        return Card(
                          color: Colors.grey[800],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      medicine['brand_name'],
                                      style: TextStyle(
                                        fontSize: 21,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      medicine['form'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF80CBC4),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  medicine['strength'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF80CBC4),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey[600],
                                ),
                                Text(
                                  medicine['company_name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  medicine['generic_name'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF80CBC4),
                                  ),
                                ),
                                SizedBox(height: 8),
                                // TextButton(
                                //   onPressed: () {
                                //
                                //   },
                                //   style: TextButton.styleFrom(
                                //     foregroundColor: Colors.white,
                                //     backgroundColor: Colors.deepPurple,
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(15),
                                //     ),
                                //   ),
                                //   child: Center(
                                //     child: Text(
                                //       "View Details",
                                //       style: TextStyle(
                                //         fontSize: 12,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
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

  Widget createTypeSelectionButton(String text, BuildContext context, int index) {
    bool isSelected = _typeSelection[index];
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple : Colors.black,
        borderRadius: isSelected? BorderRadius.circular(5): BorderRadius.circular(0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget createSortingButton(String text, int index) {
    bool isSelected = _sortSelection[index];
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple : Colors.black,
        borderRadius: isSelected? BorderRadius.circular(15): BorderRadius.circular(0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white,
          ),
        ),
      ),
    );
  }
}
