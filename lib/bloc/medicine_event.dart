import 'package:freezed_annotation/freezed_annotation.dart'; // For creating immutable data classes
part 'medicine_event.freezed.dart'; // Part file for generated code

// Define events for the Bloc
@freezed
class MedicineEvent with _$MedicineEvent {
  const factory MedicineEvent.fetch() = FetchMedicines; // Event to fetch medicines
// const factory MedicineEvent.search(String query) = SearchMedicinesByName; // Event to search by medicine name (commented)
}
