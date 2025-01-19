import 'package:meta/meta.dart';

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String receiverId;
  final String role;
  final String linkId;
  final bool viewStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.receiverId,
    required this.role,
    required this.linkId,
    required this.viewStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  // Factory method to create an instance from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      receiverId: json['receiverId'] as String,
      role: json['role'] as String,
      linkId: json['linkId'] as String,
      viewStatus: json['viewStatus'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: json['__v'] as int,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'message': message,
      'receiverId': receiverId,
      'role': role,
      'linkId': linkId,
      'viewStatus': viewStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}
