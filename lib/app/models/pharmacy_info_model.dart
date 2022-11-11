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
      'flag_24hours': flag24Hours,
      'latitude': latitude,
      'communication_list': communicationList.map((x) => x.toMap()).toList(),
      'time_zone': timeZone,
      'name': name,
      'longitude': longitude,
      'id': id,
      'npi': npi,
      'time_zone_offset': timeZoneOffset,
      'address_list': addressList.map((x) => x.toMap()).toList(),
      'hours_of_operation': hoursOfOperation.map((x) => x.toMap()).toList(),
    };
  }

  factory PharmacyInfoModel.fromMap(Map<String, dynamic> map) {
    return PharmacyInfoModel(
      nabp: map['nabp'] as String,
      flag24Hours: map['flag_24hours'] as bool,
      latitude: map['latitude'] as double,
      communicationList: List<ComunicationList>.from(
        (map['communication_list'] as List<dynamic>).map<ComunicationList>(
          (x) => ComunicationList.fromMap(x as Map<String, dynamic>),
        ),
      ),
      timeZone: map['time_zone'] as String,
      name: map['name'] as String,
      longitude: map['longitude'] as double,
      id: map['id'] as int,
      npi: map['npi'] as String,
      timeZoneOffset: map['time_zone_offset'] as int,
      addressList: List<AddressListModel>.from(
        (map['address_list'] as List<dynamic>).map<AddressListModel>(
          (x) => AddressListModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      hoursOfOperation: List<HoursOfOperation>.from(
        (map['hours_of_operation'] as List<dynamic>).map<HoursOfOperation>(
          (x) => HoursOfOperation.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PharmacyInfoModel.fromJson(String source) =>
      PharmacyInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
