import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/medicine_bloc.dart';
import '../bloc/medicine_event.dart';
import '../bloc/medicine_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedicineBloc()..add(const FetchMedicines()),  // Provide BLoC to HomePage
      child: Scaffold(
        appBar: AppBar(
          title: Text("Medicine List"),
        ),
        body: BlocBuilder<MedicineBloc, MedicineState>(
          builder: (context, state) {
            if (state is MedicineStateLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is MedicineStateError) {
              return Center(child: Text("Error: ${state.message}"));  // Handle errors
            }

            if (state is MedicineStateLoaded) {
              return ListView.builder(
                itemCount: state.medicines.length,
                itemBuilder: (context, index) {
                  var medicine = state.medicines[index];
                  return ListTile(
                    title: Text(medicine['brand_name'] ?? 'No name'),
                    subtitle: Text("${medicine['form']} - ${medicine['strength']}"),
                    trailing: Text("${medicine['price']} USD"),
                  );
                },
              );
            }

            return Center(child: Text("Unexpected State"));  // Default case
          },
        ),
      ),
    );
  }
}
