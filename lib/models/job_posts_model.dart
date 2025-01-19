class JobPostsModel {
  final String id;
  final Creator creator;
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
  final List<dynamic> bidTechnician;
  final String jobStatus;
  final String assignedTechnicianStatus;
  final bool isAssigned;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final int? jobBidPrice;

  JobPostsModel({
    required this.id,
    required this.creator,
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
    required this.bidTechnician,
    required this.jobStatus,
    required this.assignedTechnicianStatus,
    required this.isAssigned,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
    required this.jobBidPrice,
  });

  factory JobPostsModel.fromJson(Map<String, dynamic> json) {
    return JobPostsModel(
      id: json['_id'],
      creator: Creator.fromJson(json['creatorId']),
      jobLocation: json['jobLocation'],
      jobRegistration: json['jobRegistration'],
      vinGenerated: json['vinGenerated'],
      lotNo: json['lotNo'],
      make: json['make'],
      model: json['model'],
      jobType: json['jobType'],
      keyType: json['keyType'],
      jobDescription: json['jobDescription'],
      jobDeadline: DateTime.parse(json['jobDeadline']),
      bidTechnician: List<dynamic>.from(json['bidTechnician']),
      jobStatus: json['jobStatus'],
      assignedTechnicianStatus: json['assignedTechnicianStatus'],
      isAssigned: json['isAssigned'],
      isDeleted: json['isDeleted'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
      jobBidPrice: json['jobBidPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'creatorId': creator.toJson(),
      'jobLocation': jobLocation,
      'jobRegistration': jobRegistration,
      'vinGenerated': vinGenerated,
      'lotNo': lotNo,
      'make': make,
      'model': model,
      'jobType': jobType,
      'keyType': keyType,
      'jobDescription': jobDescription,
      'jobDeadline': jobDeadline.toIso8601String(),
      'bidTechnician': bidTechnician,
      'jobStatus': jobStatus,
      'assignedTechnicianStatus': assignedTechnicianStatus,
      'isAssigned': isAssigned,
      'isDeleted': isDeleted,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}

class Creator {
  final String id;
  final String email;
  final String location;
  final String image;
  final String fullName;

  Creator({
    required this.id,
    required this.email,
    required this.location,
    required this.image,
    required this.fullName,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: json['_id'],
      email: json['email'],
      location: json['location'],
      image: json['image'],
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'location': location,
      'image': image,
      'fullName': fullName,
    };
  }
}

