// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ComunicationList {
  String communicationListComm;
  int communicationListPharmacyId;
  bool communicationListSupportSms;
  String communicationListType;

  ComunicationList({
    required this.communicationListComm,
    required this.communicationListPharmacyId,
    required this.communicationListSupportSms,
    required this.communicationListType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'communication_list_comm': communicationListComm,
      'communication_list_pharmacy_id': communicationListPharmacyId,
      'communication_list_support_sms': communicationListSupportSms,
      'communication_list_type': communicationListType,
    };
  }

  factory ComunicationList.fromMap(Map<String, dynamic> map) {
    return ComunicationList(
      communicationListComm: map['communication_list_comm'] as String,
      communicationListPharmacyId: map['communication_list_pharmacy_id'] as int,
      communicationListSupportSms:
          map['communication_list_support_sms'] as bool,
      communicationListType: map['communication_list_type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComunicationList.fromJson(String source) =>
      ComunicationList.fromMap(json.decode(source) as Map<String, dynamic>);
}
