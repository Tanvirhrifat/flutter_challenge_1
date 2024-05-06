import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/medicine_bloc.dart';
import 'bloc/medicine_event.dart';
import 'bloc/medicine_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine List with BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => MedicineBloc()..add(const FetchMedicines()),  // Initialize BLoC
        child: MedicineListScreen(),
      ),
    );
  }
}

class MedicineListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicines"),
      ),
      body: BlocBuilder<MedicineBloc, MedicineState>(
        builder: (context, state) {
          if (state is MedicineStateLoading) {
            return Center(child: CircularProgressIndicator());  // Loading indication
          }

          if (state is MedicineStateError) {
            return Center(child: Text("Error: ${state.message}"));  // Display error
          }

          if (state is MedicineStateLoaded) {
            return ListView.builder(
              itemCount: state.medicines.length,
              itemBuilder: (context, index) {
                var medicine = state.medicines[index];
                return ListTile(
                  title: Text(medicine['brand_name'] ?? 'No name'),
                  subtitle: Text("${medicine['form']} - ${medicine['strength']}"),
                  trailing: Text("${medicine['price']} USD"),  // Show price
                );
              },
            );
          }

          return Center(child: Text("Unexpected State"));  // Unexpected case
        },
      ),
    );
  }
}
