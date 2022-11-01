import 'dart:convert';

class Medication {
  String name;
  String type;
  String coverage;
  String strength;
  String strengthUnit;
  int quantity;
  double price;

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
    return <String, dynamic>{
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
      name: map['name'] as String,
      type: map['type'] as String,
      coverage: map['coverage'] as String,
      strength: map['strength'] as String,
      strengthUnit: map['strength_unit'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medication.fromJson(String source) =>
      Medication.fromMap(json.decode(source) as Map<String, dynamic>);
}
