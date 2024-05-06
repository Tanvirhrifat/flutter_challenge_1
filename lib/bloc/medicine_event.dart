import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_event.freezed.dart';

@freezed
class MedicineEvent with _$MedicineEvent {
  const factory MedicineEvent.fetch() = FetchMedicines;  // Event to fetch data
}
