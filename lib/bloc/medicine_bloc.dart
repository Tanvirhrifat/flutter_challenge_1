import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_1/medicine_db.dart';
import 'medicine_event.dart';
import 'medicine_state.dart';


class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc() : super(const MedicineState.initial()) {
    on<FetchMedicines>(_onFetchMedicines);
  }

  Future<void> _onFetchMedicines(
      FetchMedicines event,
      Emitter<MedicineState> emit,
      ) async {
    emit(const MedicineState.loading());  // Start with loading state

    try {
      final medicines = await fetchMedicines();  // Fetch data from SQLite
      emit(MedicineState.loaded(medicines));  // Transition to loaded state
    } catch (e) {
      emit(MedicineState.error(e.toString()));  // Error handling
    }
  }
}
