// To parse this JSON data, do
//
//     final getAllAppointmentModel = getAllAppointmentModelFromJson(jsonString);

import 'dart:convert';

List<GetAllAppointmentModel> getAllAppointmentModelFromJson(String str) => List<GetAllAppointmentModel>.from(json.decode(str).map((x) => GetAllAppointmentModel.fromJson(x)));

String getAllAppointmentModelToJson(List<GetAllAppointmentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllAppointmentModel {
  final String? id;
  final DateTime? date;
  final String? startTime;
  final String? endTime;
  final bool? allDay;
  final bool? twelveHourBefore;
  final bool? oneDayBefore;
  final bool? twoDayBefore;
  final bool? oneWeekBefore;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  GetAllAppointmentModel({
    this.id,
    this.date,
    this.startTime,
    this.endTime,
    this.allDay,
    this.twelveHourBefore,
    this.oneDayBefore,
    this.twoDayBefore,
    this.oneWeekBefore,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory GetAllAppointmentModel.fromJson(Map<String, dynamic> json) => GetAllAppointmentModel(
    id: json["_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    startTime: json["startTime"],
    endTime: json["endTime"],
    allDay: json["allDay"],
    twelveHourBefore: json["twelveHourBefore"],
    oneDayBefore: json["oneDayBefore"],
    twoDayBefore: json["twoDayBefore"],
    oneWeekBefore: json["oneWeekBefore"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "date": date?.toIso8601String(),
    "startTime": startTime,
    "endTime": endTime,
    "allDay": allDay,
    "twelveHourBefore": twelveHourBefore,
    "oneDayBefore": oneDayBefore,
    "twoDayBefore": twoDayBefore,
    "oneWeekBefore": oneWeekBefore,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
