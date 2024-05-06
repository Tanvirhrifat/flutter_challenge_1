part of 'medicine_bloc.dart';

@immutable
abstract class MedicineState {}

class MedicineLoading extends MedicineState {}

class MedicineLoaded extends MedicineState {
  final List<Medicine> medicines;

  MedicineLoaded(this.medicines);
}

class MedicineError extends MedicineState {
  final String error;

  MedicineError(this.error);
}
