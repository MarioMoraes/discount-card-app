// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HoursOfOperation {
  String hoursOfOperationListCloseHour;
  String hoursOfOperationListOpenHour;
  String hoursOfOperationListDayOfWeek;
  int hoursOfOperationListPharmacyId;

  HoursOfOperation({
    required this.hoursOfOperationListCloseHour,
    required this.hoursOfOperationListOpenHour,
    required this.hoursOfOperationListDayOfWeek,
    required this.hoursOfOperationListPharmacyId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hours_of_operation_list_close_hour': hoursOfOperationListCloseHour,
      'hours_of_operation_list_open_hour': hoursOfOperationListOpenHour,
      'hours_of_operation_list_day_of_week': hoursOfOperationListDayOfWeek,
      'hours_of_operation_list_pharmacy_id': hoursOfOperationListPharmacyId,
    };
  }

  factory HoursOfOperation.fromMap(Map<String, dynamic> map) {
    return HoursOfOperation(
      hoursOfOperationListCloseHour:
          map['hours_of_operation_list_close_hour'] as String,
      hoursOfOperationListOpenHour:
          map['hours_of_operation_list_open_hour'] as String,
      hoursOfOperationListDayOfWeek:
          map['hours_of_operation_list_day_of_week'] as String,
      hoursOfOperationListPharmacyId:
          map['hours_of_operation_list_pharmacy_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HoursOfOperation.fromJson(String source) =>
      HoursOfOperation.fromMap(json.decode(source) as Map<String, dynamic>);
}
