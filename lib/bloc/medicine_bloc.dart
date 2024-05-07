import 'package:flutter_bloc/flutter_bloc.dart';
import 'medicine_event.dart';
import 'medicine_state.dart';
import 'package:flutter_challenge_1/Repository/medicine_db.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final MedicineRepository _medicineRepository;

  MedicineBloc(this._medicineRepository)
      : super(const MedicineState.initial()) {
    on<FetchMedicines>(_onFetchMedicines);
  }

  Future<void> _onFetchMedicines(FetchMedicines event,
      Emitter<MedicineState> emit,) async {
    emit(const MedicineState.loading());

    try {
      final medicines = await _medicineRepository.fetchMedicines();
      emit(MedicineState.loaded(medicines));
    } catch (e) {
      emit(MedicineState.error(e.toString()));
    }
  }


//   Future<void> _onSearchMedicinesByName(
//       SearchMedicinesByName event,
//       Emitter<MedicineState> emit,
//       ) async {
//     emit(const MedicineState.loading());
//
//     try {
//
//     } catch (e) {
//       emit(MedicineState.error(e.toString()));
//     }
//   }
// }
}
