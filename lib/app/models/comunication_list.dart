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
      'communicationListComm': communicationListComm,
      'communicationListPharmacyId': communicationListPharmacyId,
      'communicationListSupportSms': communicationListSupportSms,
      'communicationListType': communicationListType,
    };
  }

  factory ComunicationList.fromMap(Map<String, dynamic> map) {
    return ComunicationList(
      communicationListComm: map['communicationListComm'] as String,
      communicationListPharmacyId: map['communicationListPharmacyId'] as int,
      communicationListSupportSms: map['communicationListSupportSms'] as bool,
      communicationListType: map['communicationListType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComunicationList.fromJson(String source) =>
      ComunicationList.fromMap(json.decode(source) as Map<String, dynamic>);
}
