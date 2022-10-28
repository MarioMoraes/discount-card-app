import 'dart:convert';

class Pharmacy {
  String nabp;
  double distance;
  String name;
  String phoneNumber;
  String address;
  String city;
  String state;

  Pharmacy({
    required this.nabp,
    required this.distance,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return {
      'nabp': nabp,
      'distance': distance,
      'name': name,
      'phone_number': phoneNumber,
      'address': address,
      'city': city,
      'state': state,
    };
  }

  factory Pharmacy.fromMap(Map<String, dynamic> map) {
    return Pharmacy(
      nabp: map['nabp'] ?? '',
      distance: map['distance']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Pharmacy.fromJson(String source) =>
      Pharmacy.fromMap(json.decode(source));
}
