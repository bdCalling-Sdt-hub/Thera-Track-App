// To parse this JSON data, do
//
//     final profileInformationModel = profileInformationModelFromJson(jsonString);

import 'dart:convert';

ProfileInformationModel profileInformationModelFromJson(String str) => ProfileInformationModel.fromJson(json.decode(str));

String profileInformationModelToJson(ProfileInformationModel data) => json.encode(data.toJson());

class ProfileInformationModel {
  String? id;
  String? firstName;
  String? email;
  String? phoneNumber;
  String? role;
  bool? isHumanTrue;
  bool? isDeleted;
  bool? isBlocked;
  bool? isEmailVerified;
  bool? isResetPassword;
  dynamic oneTimeCode;
  dynamic oneTimeCodeExpire;
  dynamic otpCountDown;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? city;
  String? postCode;
  String? country;
  String? profileImage;
  String? fullName;
  String? profileInformationModelId;

  ProfileInformationModel({
    this.id,
    this.firstName,
    this.email,
    this.phoneNumber,
    this.role,
    this.isHumanTrue,
    this.isDeleted,
    this.isBlocked,
    this.isEmailVerified,
    this.isResetPassword,
    this.oneTimeCode,
    this.oneTimeCodeExpire,
    this.otpCountDown,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.city,
    this.postCode,
    this.country,
    this.profileImage,
    this.fullName,
    this.profileInformationModelId,
  });

  factory ProfileInformationModel.fromJson(Map<String, dynamic> json) => ProfileInformationModel(
    id: json["_id"],
    firstName: json["firstName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    role: json["role"],
    isHumanTrue: json["isHumanTrue"],
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    isEmailVerified: json["isEmailVerified"],
    isResetPassword: json["isResetPassword"],
    oneTimeCode: json["oneTimeCode"],
    oneTimeCodeExpire: json["oneTimeCodeExpire"],
    otpCountDown: json["otpCountDown"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    city: json["city"],
    postCode: json["postCode"],
    country: json["country"],
    profileImage: json["profileImage"],
    fullName: json["fullName"],
    profileInformationModelId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "email": email,
    "phoneNumber": phoneNumber,
    "role": role,
    "isHumanTrue": isHumanTrue,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "isEmailVerified": isEmailVerified,
    "isResetPassword": isResetPassword,
    "oneTimeCode": oneTimeCode,
    "oneTimeCodeExpire": oneTimeCodeExpire,
    "otpCountDown": otpCountDown,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "city": city,
    "postCode": postCode,
    "country": country,
    "profileImage": profileImage,
    "fullName": fullName,
    "id": profileInformationModelId,
  };
}
