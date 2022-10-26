import 'dart:convert';

class DrugModel {
  DrugModel({
    required this.dosage,
    required this.gpi12,
    required this.coverageInfo,
    required this.gpi2,
    required this.gpi10,
    required this.name,
    required this.strength,
    required this.typeDescription,
    required this.type,
    required this.gpi4,
    required this.gpi14,
    required this.coverage,
    required this.strengthUnit,
  });

  String dosage;
  String gpi12;
  CoverageInfo coverageInfo;
  String gpi2;
  String gpi10;
  String name;
  String strength;
  String typeDescription;
  String type;
  String gpi4;
  String gpi14;
  String coverage;
  String strengthUnit;

  factory DrugModel.fromJson(String str) => DrugModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DrugModel.fromMap(Map<String, dynamic> json) => DrugModel(
        dosage: json["dosage"],
        gpi12: json["gpi12"],
        coverageInfo: CoverageInfo.fromMap(json["coverage_info"]),
        gpi2: json["gpi2"],
        gpi10: json["gpi10"],
        name: json["name"],
        strength: json["strength"],
        typeDescription: json["type_description"],
        type: json["type"],
        gpi4: json["gpi4"],
        gpi14: json["gpi14"],
        coverage: json["coverage"],
        strengthUnit: json["strength_unit"],
      );

  Map<String, dynamic> toMap() => {
        "dosage": dosage,
        "gpi12": gpi12,
        "coverage_info": coverageInfo.toMap(),
        "gpi2": gpi2,
        "gpi10": gpi10,
        "name": name,
        "strength": strength,
        "type_description": typeDescription,
        "type": type,
        "gpi4": gpi4,
        "gpi14": gpi14,
        "coverage": coverage,
        "strength_unit": strengthUnit,
      };
}

class CoverageInfo {
  CoverageInfo({
    required this.formulary,
    required this.otc,
    required this.specialty,
    required this.otcRxIndicator,
    required this.quantityLimit,
    required this.priorAuth,
    required this.stepTherapy,
  });

  bool formulary;
  bool otc;
  bool specialty;
  String otcRxIndicator;
  bool quantityLimit;
  bool priorAuth;
  bool stepTherapy;

  factory CoverageInfo.fromJson(String str) =>
      CoverageInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoverageInfo.fromMap(Map<String, dynamic> json) => CoverageInfo(
        formulary: json["formulary"],
        otc: json["otc"],
        specialty: json["specialty"],
        otcRxIndicator: json["otc_rx_indicator"],
        quantityLimit: json["quantity_limit"],
        priorAuth: json["prior_auth"],
        stepTherapy: json["step_therapy"],
      );

  Map<String, dynamic> toMap() => {
        "formulary": formulary,
        "otc": otc,
        "specialty": specialty,
        "otc_rx_indicator": otcRxIndicator,
        "quantity_limit": quantityLimit,
        "prior_auth": priorAuth,
        "step_therapy": stepTherapy,
      };
}
