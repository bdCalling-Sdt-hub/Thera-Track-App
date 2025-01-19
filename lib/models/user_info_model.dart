class UserInfoModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String location;
  final String image;
  final String? stripeCustomerId;
  final String role;
  final bool isDeleted;
  final bool isBlocked;
  final bool isEmailVerified;
  final bool isResetPassword;
  final String oneTimeCode;
  final DateTime oneTimeCodeExpire;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fullName;
  final int version;
  final int otpCountDown;
  final String status;
  final String? businessName;
  final String? dateOfBirth;
  final String? homeAddress;
  final String? workExperience;
  final String? workVehicle;

  UserInfoModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.image,
    this.stripeCustomerId,
    required this.role,
    required this.isDeleted,
    required this.isBlocked,
    required this.isEmailVerified,
    required this.isResetPassword,
    required this.oneTimeCode,
    required this.oneTimeCodeExpire,
    required this.createdAt,
    required this.updatedAt,
    required this.fullName,
    required this.version,
    required this.otpCountDown,
    required this.status,
    this.businessName,
    this.dateOfBirth,
    this.homeAddress,
    this.workExperience,
    this.workVehicle,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
      stripeCustomerId: json['stripeCustomerId'] as String?,
      role: json['role'] as String,
      isDeleted: json['isDeleted'] as bool,
      isBlocked: json['isBlocked'] as bool,
      isEmailVerified: json['isEmailVerified'] as bool,
      isResetPassword: json['isResetPassword'] as bool,
      oneTimeCode: json['oneTimeCode'] as String,
      oneTimeCodeExpire: DateTime.parse(json['oneTimeCodeExpire']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      fullName: json['fullName'] as String,
      version: json['__v'] as int,
      otpCountDown: json['otpCountDown'] as int,
      status: json['status'] as String,
      businessName: json['businessName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      homeAddress: json['homeAddress'] as String?,
      workExperience: json['workExperience'] as String?,
      workVehicle: json['workVehicle'] as String?,
    );
  }
}
