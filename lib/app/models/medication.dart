import 'dart:convert';

class Medication {
  String name;
  String type;
  String coverage;
  String strength;
  String strengthUnit;
  int quantity;
  String price;

  Medication({
    required this.name,
    required this.type,
    required this.coverage,
    required this.strength,
    required this.strengthUnit,
    required this.quantity,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'coverage': coverage,
      'strength': strength,
      'strength_unit': strengthUnit,
      'quantity': quantity,
      'price': price,
    };
  }

  factory Medication.fromMap(Map<String, dynamic> map) {
    return Medication(
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      coverage: map['coverage'] ?? '',
      strength: map['strength'] ?? '',
      strengthUnit: map['strength_unit'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      price: map['price'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Medication.fromJson(String source) =>
      Medication.fromMap(json.decode(source));
}
