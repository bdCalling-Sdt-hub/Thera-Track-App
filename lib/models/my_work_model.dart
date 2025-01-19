class MyWorkModel {
  final String id;
  final String jobLocation;
  final String jobRegistration;
  final String vinGenerated;
  final String lotNo;
  final String make;
  final String model;
  final String jobType;
  final String keyType;
  final String jobDescription;
  final DateTime jobDeadline;
  final String jobStatus;
  final String assignedTechnicianStatus;
  final bool isAssigned;
  final bool isDeleted;
  final AssignedTechnician assignedTechnician;
  final CreatorDetails creatorDetails; // Added this field
  final List<BidTechnician> bidTechnicians;

  MyWorkModel({
    required this.id,
    required this.jobLocation,
    required this.jobRegistration,
    required this.vinGenerated,
    required this.lotNo,
    required this.make,
    required this.model,
    required this.jobType,
    required this.keyType,
    required this.jobDescription,
    required this.jobDeadline,
    required this.jobStatus,
    required this.assignedTechnicianStatus,
    required this.isAssigned,
    required this.isDeleted,
    required this.assignedTechnician,
    required this.creatorDetails, // Constructor addition
    required this.bidTechnicians,
  });

  factory MyWorkModel.fromJson(Map<String, dynamic> json) {
    return MyWorkModel(
      id: json['_id'] ?? '',
      jobLocation: json['jobLocation'] ?? '',
      jobRegistration: json['jobRegistration'] ?? '',
      vinGenerated: json['vinGenerated'] ?? '',
      lotNo: json['lotNo'] ?? '',
      make: json['make'] ?? '',
      model: json['model'] ?? '',
      jobType: json['jobType'] ?? '',
      keyType: json['keyType'] ?? '',
      jobDescription: json['jobDescription'] ?? '',
      jobDeadline: json['jobDeadline'] != null
          ? DateTime.parse(json['jobDeadline'])
          : DateTime.parse('1970-01-01T00:00:00Z'),
      jobStatus: json['jobStatus'] ?? 'Unknown',
      assignedTechnicianStatus: json['assignedTechnicianStatus'] ?? 'Unknown',
      isAssigned: json['isAssigned'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      assignedTechnician: json['assignedTechnician'] != null
          ? AssignedTechnician.fromJson(json['assignedTechnician'])
          : AssignedTechnician(id: '', fullName: '', email: '', phoneNumber: '', location: '', image: ''),
      creatorDetails: json['creatorId'] != null // Parse creatorId
          ? CreatorDetails.fromJson(json['creatorId'])
          : CreatorDetails(id: '', fullName: '', email: '', phoneNumber: '', location: '', image: ''),
      bidTechnicians: json['bidTechnician'] is List
          ? (json['bidTechnician'] as List).map((item) => BidTechnician.fromJson(item)).toList()
          : [],
    );
  }
}

class CreatorDetails {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String location;
  final String image;

  CreatorDetails({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.image,
  });

  factory CreatorDetails.fromJson(Map<String, dynamic> json) {
    return CreatorDetails(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class AssignedTechnician {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String location;
  final String image;

  AssignedTechnician({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.image,
  });

  factory AssignedTechnician.fromJson(Map<String, dynamic> json) {
    return AssignedTechnician(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class BidTechnician {
  final String jobId;
  final TechnicianDetails technicianDetails;
  final int bidPrice;

  BidTechnician({
    required this.jobId,
    required this.technicianDetails,
    required this.bidPrice,
  });

  factory BidTechnician.fromJson(Map<String, dynamic> json) {
    return BidTechnician(
      jobId: json['jobId'] ?? '',
      technicianDetails: TechnicianDetails.fromJson(json['technicianId'] ?? {}),
      bidPrice: json['bidPrice'] ?? 0,
    );
  }
}

class TechnicianDetails {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String location;
  final String image;

  TechnicianDetails({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.location,
    required this.image,
  });

  factory TechnicianDetails.fromJson(Map<String, dynamic> json) {
    return TechnicianDetails(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
