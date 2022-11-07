// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DrugsFilterModel {
  String coverage;
  String type;
  String strengthUnit;
  String strength;

  DrugsFilterModel({
    required this.coverage,
    required this.type,
    required this.strengthUnit,
    required this.strength,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coverage': coverage,
      'type': type,
      'strength_unit': strengthUnit,
      'strength': strength,
    };
  }

  factory DrugsFilterModel.fromMap(Map<String, dynamic> map) {
    return DrugsFilterModel(
      coverage: map['coverage'] as String,
      type: map['type'] as String,
      strengthUnit: map['strength_unit'] as String,
      strength: map['strength'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DrugsFilterModel.fromJson(String source) =>
      DrugsFilterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DrugsFilterModel(coverage: $coverage, type: $type, strengthUnit: $strengthUnit, strength: $strength)';
  }
}
