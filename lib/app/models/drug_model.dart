// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  String? strength;
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
    return <String, dynamic>{
      'type': type,
      'gpi4': gpi4,
      'gpi2': gpi2,
      'coverage': coverage,
      'otcRxIndicator': otcRxIndicator,
      'typeDescription': typeDescription,
      'dosage': dosage,
      'name': name,
      'strengthUnit': strengthUnit,
      'gpi12': gpi12,
      'strength': strength,
      'gpi14': gpi14,
    };
  }

  factory DrugModel.fromMap(Map<String, dynamic> map) {
    return DrugModel(
      type: map['type'] != null ? map['type'] as String : null,
      gpi4: map['gpi4'] != null ? map['gpi4'] as String : null,
      gpi2: map['gpi2'] != null ? map['gpi2'] as String : null,
      coverage: map['coverage'] != null ? map['coverage'] as String : null,
      otcRxIndicator: map['otcRxIndicator'] != null
          ? map['otcRxIndicator'] as String
          : null,
      typeDescription: map['typeDescription'] != null
          ? map['typeDescription'] as String
          : null,
      dosage: map['dosage'] != null ? map['dosage'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      strengthUnit:
          map['strengthUnit'] != null ? map['strengthUnit'] as String : null,
      gpi12: map['gpi12'] != null ? map['gpi12'] as String : null,
      strength: map['strength'] != null ? map['strength'] as String : null,
      gpi14: map['gpi14'] != null ? map['gpi14'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DrugModel.fromJson(String source) =>
      DrugModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
