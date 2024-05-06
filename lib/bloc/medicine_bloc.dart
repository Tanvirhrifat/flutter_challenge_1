import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../medicine.dart';
import '../medicine_repository.dart';

part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final MedicineRepository repository;

  MedicineBloc(this.repository) : super(MedicineLoading()) {
    on<LoadMedicines>((event, emit) async {
      try {
        final medicines = await repository.getAllMedicines();
        emit(MedicineLoaded(medicines));
      } catch (e) {
        emit(MedicineError('Failed to load medicines'));
      }
    });
  }
}
