import 'package:freezed_annotation/freezed_annotation.dart'; // For creating immutable states
part 'medicine_state.freezed.dart'; // Part file for generated code

// Define states for the Bloc
@freezed
class MedicineState with _$MedicineState {
  const factory MedicineState.initial() = MedicineStateInitial; // Initial state
  const factory MedicineState.loading() = MedicineStateLoading; // Loading state
  const factory MedicineState.loaded(List<Map<String, dynamic>> medicines) = MedicineStateLoaded; // Data loaded state with list of medicines
  const factory MedicineState.error(String message) = MedicineStateError; // Error state with error message
}
