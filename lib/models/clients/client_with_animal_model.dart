// To parse this JSON data, do
//
//     final getClientWithAnimalModel = getClientWithAnimalModelFromJson(jsonString);

import 'dart:convert';

List<GetClientWithAnimalModel> getClientWithAnimalModelFromJson(String str) => List<GetClientWithAnimalModel>.from(json.decode(str).map((x) => GetClientWithAnimalModel.fromJson(x)));

String getClientWithAnimalModelToJson(List<GetClientWithAnimalModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetClientWithAnimalModel {
  final Address? address;
  final String? id;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? other;
  final int? v;
  final bool? humanClient;

  GetClientWithAnimalModel({
    this.address,
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.other,
    this.v,
    this.humanClient,
  });

  factory GetClientWithAnimalModel.fromJson(Map<String, dynamic> json) => GetClientWithAnimalModel(
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    id: json["_id"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    other: json["other"],
    v: json["__v"],
    humanClient: json["humanClient"],
  );

  Map<String, dynamic> toJson() => {
    "address": address?.toJson(),
    "_id": id,
    "name": name,
    "phoneNumber": phoneNumber,
    "email": email,
    "other": other,
    "__v": v,
    "humanClient": humanClient,
  };
}

class Address {
  final String? city;
  final String? state;
  final String? zip;

  Address({
    this.city,
    this.state,
    this.zip,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    state: json["state"],
    zip: json["zip"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
    "zip": zip,
  };
}
