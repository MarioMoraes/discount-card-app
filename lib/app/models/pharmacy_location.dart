// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'location.dart';
import 'pharmacy.dart';

class PharmacyLocation {
  Location location;
  Pharmacy pharmacy;

  PharmacyLocation({
    required this.location,
    required this.pharmacy,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location.toMap(),
      'pharmacy': pharmacy.toMap(),
    };
  }

  factory PharmacyLocation.fromMap(Map<String, dynamic> map) {
    return PharmacyLocation(
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      pharmacy: Pharmacy.fromMap(map['pharmacy'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PharmacyLocation.fromJson(String source) =>
      PharmacyLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
