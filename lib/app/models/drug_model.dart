import 'dart:convert';

class DrugModel {
  String? type;
  String? gpi4;
  String? gpi2;
  String? coverage;
  String? otcRxIndicator;
  String? typeDescription;
  String? dosage;
  String? name;
  String? strengthUnit;
  String? gpi12;
  int? strength;
  String? gpi14;

  DrugModel({
    this.type,
    this.gpi4,
    this.gpi2,
    this.coverage,
    this.otcRxIndicator,
    this.typeDescription,
    this.dosage,
    this.name,
    this.strengthUnit,
    this.gpi12,
    this.strength,
    this.gpi14,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'gpi4': gpi4,
      'gpi2': gpi2,
      'coverage': coverage,
      'otc_rx_indicator': otcRxIndicator,
      'type_description': typeDescription,
      'dosage': dosage,
      'name': name,
      'strength_unit': strengthUnit,
      'gpi12': gpi12,
      'strength': strength,
      'gpi14': gpi14,
    };
  }

  factory DrugModel.fromMap(Map<String, dynamic> map) {
    return DrugModel(
      type: map['type'],
      gpi4: map['gpi4'],
      gpi2: map['gpi2'],
      coverage: map['coverage'],
      otcRxIndicator: map['otc_rx_indicator'],
      typeDescription: map['type_description'],
      dosage: map['dosage'],
      name: map['name'],
      strengthUnit: map['strength_unit'],
      gpi12: map['gpi12'],
      strength: map['strength']?.toInt(),
      gpi14: map['gpi14'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DrugModel.fromJson(String source) =>
      DrugModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DrugModel(type: $type, gpi4: $gpi4, gpi2: $gpi2, coverage: $coverage, otcRxIndicator: $otcRxIndicator, typeDescription: $typeDescription, dosage: $dosage, name: $name, strengthUnit: $strengthUnit, gpi12: $gpi12, strength: $strength, gpi14: $gpi14)';
  }
}
