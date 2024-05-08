import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc package for Flutter
import '../Repository/medicine_repository.dart';
import 'medicine_event.dart'; // Import event definitions
import 'medicine_state.dart'; // Import state definitions


// Bloc for managing medicine-related state transitions
class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final MedicineRepository _medicineRepository; // The repository for data operations

  // Initialize the Bloc with the repository and set the initial state
  MedicineBloc(this._medicineRepository)
      : super(const MedicineState.initial()) {
    // Define event handlers
    on<FetchMedicines>(_onFetchMedicines); // Handle the FetchMedicines event
  }

  // Event handler for FetchMedicines
  Future<void> _onFetchMedicines(FetchMedicines event, Emitter<MedicineState> emit) async {
    emit(const MedicineState.loading()); // Transition to loading state

    try {
      // Fetch data from the repository and transition to the loaded state
      final medicines = await _medicineRepository.fetchMedicines();
      emit(MedicineState.loaded(medicines)); // Pass fetched data to the state
    } catch (e) {
      // If an error occurs, transition to the error state with the error message
      emit(MedicineState.error(e.toString()));
    }
  }
}
