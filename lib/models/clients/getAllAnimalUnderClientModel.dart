import 'dart:convert';

class GetAnimalUnderOneClientModel {
  String id;
  String clientId;
  List<String> areaOfConcern;
  List<Treatment> treatments;
  List<InventoryItem> inventoryAcc;
  String description;
  int fullCost;
  String name;
  int age;
  bool isHuman;
  bool isAnimal;
  String breed;
  String gender;
  int? height;
  String color;
  int discount;
  int finalCost;
  bool isPaid;
  List<String> points;
  List<String> concernImages;
  String apDate;
  String apStartTime;
  String apEndTime;
  bool reAllDay;
  bool reTwelveHourBefore;
  bool reOneDayBefore;
  bool reTwoDayBefore;
  bool reOneWeekBefore;
  bool isAppointment;
  String selectedAnimal;
  String createdAt;
  String updatedAt;
  int v;

  GetAnimalUnderOneClientModel({
    required this.id,
    required this.clientId,
    required this.areaOfConcern,
    required this.treatments,
    required this.inventoryAcc,
    required this.description,
    required this.fullCost,
    required this.name,
    required this.age,
    required this.isHuman,
    required this.isAnimal,
    required this.breed,
    required this.gender,
    required this.height,
    required this.color,
    required this.discount,
    required this.finalCost,
    required this.isPaid,
    required this.points,
    required this.concernImages,
    required this.apDate,
    required this.apStartTime,
    required this.apEndTime,
    required this.reAllDay,
    required this.reTwelveHourBefore,
    required this.reOneDayBefore,
    required this.reTwoDayBefore,
    required this.reOneWeekBefore,
    required this.isAppointment,
    required this.selectedAnimal,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory GetAnimalUnderOneClientModel.fromJson(Map<String, dynamic> json) {
    return GetAnimalUnderOneClientModel(
      id: json['_id'] ?? '',
      clientId: json['clientId'] ?? '',
      areaOfConcern: (json['areaOfConcern'] as List?)?.map((e) => e.toString()).toList() ?? [],
      treatments: (json['treatments'] as List?)?.map((x) => Treatment.fromJson(x)).toList() ?? [],
      inventoryAcc: (json['inventoryAcc'] as List?)?.map((x) => InventoryItem.fromJson(x)).toList() ?? [],
      description: json['description'] ?? '',
      fullCost: json['fullCost'] ?? 0,
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      isHuman: json['isHuman'] ?? false,
      isAnimal: json['isAnimal'] ?? false,
      breed: json['breed'] ?? '',
      gender: json['gender'] ?? '',
      height: json['height'],
      color: json['color'] ?? '',
      discount: json['discount'] ?? 0,
      finalCost: json['finalCost'] ?? 0,
      isPaid: json['isPaid'] ?? false,
      points: (json['points'] as List?)?.map((e) => e.toString()).toList() ?? [],
      concernImages: (json['Concern_images'] as List?)?.map((e) => e.toString()).toList() ?? [],
      apDate: json['ApDate'] ?? '',
      apStartTime: json['ApStartTime'] ?? '',
      apEndTime: json['ApEndTime'] ?? '',
      reAllDay: json['ReAllDay'] ?? false,
      reTwelveHourBefore: json['ReTwelveHourBefore'] ?? false,
      reOneDayBefore: json['ReOneDayBefore'] ?? false,
      reTwoDayBefore: json['ReTwoDayBefore'] ?? false,
      reOneWeekBefore: json['ReOneWeekBefore'] ?? false,
      isAppointment: json['isAppointment'] ?? false,
      selectedAnimal: json['selectedAnimal'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}

class Treatment {
  String name;
  int value;

  Treatment({required this.name, required this.value});

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
      name: json['name'] ?? '',
      value: json['value'] ?? 0,
    );
  }
}

class InventoryItem {
  String productName;
  int quantity;

  InventoryItem({required this.productName, required this.quantity});

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      productName: json['productName'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }
}