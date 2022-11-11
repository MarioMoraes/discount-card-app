// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:discount_card_app/app/models/address_list_model.dart';
import 'package:discount_card_app/app/models/comunication_list.dart';

import 'hours_of_operation.dart';

class PharmacyInfoModel {
  String nabp;
  bool flag24Hours;
  double latitude;
  List<ComunicationList> communicationList;
  String timeZone;
  String name;
  double longitude;
  int id;
  String npi;
  int timeZoneOffset;
  List<AddressListModel> addressList;
  List<HoursOfOperation> hoursOfOperation;

  PharmacyInfoModel({
    required this.nabp,
    required this.flag24Hours,
    required this.latitude,
    required this.communicationList,
    required this.timeZone,
    required this.name,
    required this.longitude,
    required this.id,
    required this.npi,
    required this.timeZoneOffset,
    required this.addressList,
    required this.hoursOfOperation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nabp': nabp,
      'flag24Hours': flag24Hours,
      'latitude': latitude,
      'communicationList': communicationList.map((x) => x.toMap()).toList(),
      'timeZone': timeZone,
      'name': name,
      'longitude': longitude,
      'id': id,
      'npi': npi,
      'timeZoneOffset': timeZoneOffset,
      'addressList': addressList.map((x) => x.toMap()).toList(),
      'hoursOfOperation': hoursOfOperation.map((x) => x.toMap()).toList(),
    };
  }

  factory PharmacyInfoModel.fromMap(Map<String, dynamic> map) {
    return PharmacyInfoModel(
      nabp: map['nabp'] as String,
      flag24Hours: map['flag24Hours'] as bool,
      latitude: map['latitude'] as double,
      communicationList: List<ComunicationList>.from(
        (map['communicationList'] as List<int>).map<ComunicationList>(
          (x) => ComunicationList.fromMap(x as Map<String, dynamic>),
        ),
      ),
      timeZone: map['timeZone'] as String,
      name: map['name'] as String,
      longitude: map['longitude'] as double,
      id: map['id'] as int,
      npi: map['npi'] as String,
      timeZoneOffset: map['timeZoneOffset'] as int,
      addressList: List<AddressListModel>.from(
        (map['addressList'] as List<int>).map<AddressListModel>(
          (x) => AddressListModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      hoursOfOperation: List<HoursOfOperation>.from(
        (map['hoursOfOperation'] as List<int>).map<HoursOfOperation>(
          (x) => HoursOfOperation.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PharmacyInfoModel.fromJson(String source) =>
      PharmacyInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
