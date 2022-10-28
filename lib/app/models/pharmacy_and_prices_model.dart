import 'dart:convert';

import 'location.dart';
import 'medication.dart';
import 'pharmacy.dart';

class PharmacyAndPrices {
  Pharmacy pharmacy;
  Medication medication;
  Location location;

  PharmacyAndPrices({
    required this.pharmacy,
    required this.medication,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'pharmacy': pharmacy.toMap(),
      'medication': medication.toMap(),
      'location': location.toMap(),
    };
  }

  factory PharmacyAndPrices.fromMap(Map<String, dynamic> map) {
    return PharmacyAndPrices(
      pharmacy: Pharmacy.fromMap(map['pharmacy']),
      medication: Medication.fromMap(map['medication']),
      location: Location.fromMap(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PharmacyAndPrices.fromJson(String source) =>
      PharmacyAndPrices.fromMap(json.decode(source));
}
