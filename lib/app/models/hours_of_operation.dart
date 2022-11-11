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
      'hoursOfOperationListCloseHour': hoursOfOperationListCloseHour,
      'hoursOfOperationListOpenHour': hoursOfOperationListOpenHour,
      'hoursOfOperationListDayOfWeek': hoursOfOperationListDayOfWeek,
      'hoursOfOperationListPharmacyId': hoursOfOperationListPharmacyId,
    };
  }

  factory HoursOfOperation.fromMap(Map<String, dynamic> map) {
    return HoursOfOperation(
      hoursOfOperationListCloseHour:
          map['hoursOfOperationListCloseHour'] as String,
      hoursOfOperationListOpenHour:
          map['hoursOfOperationListOpenHour'] as String,
      hoursOfOperationListDayOfWeek:
          map['hoursOfOperationListDayOfWeek'] as String,
      hoursOfOperationListPharmacyId:
          map['hoursOfOperationListPharmacyId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HoursOfOperation.fromJson(String source) =>
      HoursOfOperation.fromMap(json.decode(source) as Map<String, dynamic>);
}
