import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pharmacy {
  String nabp;
  String name;
  String address;
  String city;
  String state;
  String phoneNumber;
  double distance;

  Pharmacy({
    required this.nabp,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.phoneNumber,
    required this.distance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nabp': nabp,
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'phone_number': phoneNumber,
      'distance': distance,
    };
  }

  factory Pharmacy.fromMap(Map<String, dynamic> map) {
    return Pharmacy(
      nabp: map['nabp'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      phoneNumber: map['phone_number'] as String,
      distance: map['distance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pharmacy.fromJson(String source) =>
      Pharmacy.fromMap(json.decode(source) as Map<String, dynamic>);
}
