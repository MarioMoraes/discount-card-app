// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'location.dart';
import 'medication.dart';
import 'pharmacy.dart';

class PharmacyAndPricesModel {
  Pharmacy pharmacy;
  Medication medication;
  Location location;

  PharmacyAndPricesModel({
    required this.pharmacy,
    required this.medication,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pharmacy': pharmacy.toMap(),
      'medication': medication.toMap(),
      'location': location.toMap(),
    };
  }

  factory PharmacyAndPricesModel.fromMap(Map<String, dynamic> map) {
    return PharmacyAndPricesModel(
      pharmacy: Pharmacy.fromMap(map['pharmacy'] as Map<String, dynamic>),
      medication: Medication.fromMap(map['medication'] as Map<String, dynamic>),
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PharmacyAndPricesModel.fromJson(String source) =>
      PharmacyAndPricesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
