import 'dart:convert';

class AddressListModel {
  String addressListState;
  int addressListPharmacyId;
  String addressListType;
  String addressListCity;
  String addressListZipCode;
  String addressListAddressLine1;

  AddressListModel({
    required this.addressListState,
    required this.addressListPharmacyId,
    required this.addressListType,
    required this.addressListCity,
    required this.addressListZipCode,
    required this.addressListAddressLine1,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address_list_state': addressListState,
      'address_list_pharmacy_id': addressListPharmacyId,
      'address_list_type': addressListType,
      'address_list_city': addressListCity,
      'address_list_zip_code': addressListZipCode,
      'address_list_address_line1': addressListAddressLine1,
    };
  }

  factory AddressListModel.fromMap(Map<String, dynamic> map) {
    return AddressListModel(
      addressListState: map['address_list_state'] as String,
      addressListPharmacyId: map['address_list_pharmacy_id'] as int,
      addressListType: map['address_list_type'] as String,
      addressListCity: map['address_list_city'] as String,
      addressListZipCode: map['address_list_zip_code'] as String,
      addressListAddressLine1: map['address_list_address_line1'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressListModel.fromJson(String source) =>
      AddressListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
