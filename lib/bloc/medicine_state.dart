import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_state.freezed.dart';

@freezed
class MedicineState with _$MedicineState {
  const factory MedicineState.initial() = MedicineStateInitial;  // Initial state
  const factory MedicineState.loading() = MedicineStateLoading;  // Loading state
  const factory MedicineState.loaded(List<Map<String, dynamic>> medicines) = MedicineStateLoaded;  // Data loaded
  const factory MedicineState.error(String message) = MedicineStateError;  // Error state
}
