import 'dart:convert';

class AddressListModel {
  String addressListState;
  int addressListPharmacyId;
  String addressListType;
  String addressListCity;
  String addressListZipCode;
  String addressListAddressLine1;
  String addressListAddressLine2;

  AddressListModel({
    required this.addressListState,
    required this.addressListPharmacyId,
    required this.addressListType,
    required this.addressListCity,
    required this.addressListZipCode,
    required this.addressListAddressLine1,
    required this.addressListAddressLine2,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addressListState': addressListState,
      'addressListPharmacyId': addressListPharmacyId,
      'addressListType': addressListType,
      'addressListCity': addressListCity,
      'addressListZipCode': addressListZipCode,
      'addressListAddressLine1': addressListAddressLine1,
      'addressListAddressLine2': addressListAddressLine2,
    };
  }

  factory AddressListModel.fromMap(Map<String, dynamic> map) {
    return AddressListModel(
      addressListState: map['addressListState'] as String,
      addressListPharmacyId: map['addressListPharmacyId'] as int,
      addressListType: map['addressListType'] as String,
      addressListCity: map['addressListCity'] as String,
      addressListZipCode: map['addressListZipCode'] as String,
      addressListAddressLine1: map['addressListAddressLine1'] as String,
      addressListAddressLine2: map['addressListAddressLine2'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressListModel.fromJson(String source) =>
      AddressListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
