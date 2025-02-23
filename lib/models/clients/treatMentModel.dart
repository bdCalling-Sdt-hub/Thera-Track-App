class GetAllTreatMentModel {
  final bool isAnimal;
  final bool isHuman;
  final String id;
  final String treatmentTitle;
  final int price;
  final int v;

  GetAllTreatMentModel({
    required this.isAnimal,
    required this.isHuman,
    required this.id,
    required this.treatmentTitle,
    required this.price,
    required this.v,
  });

  factory GetAllTreatMentModel.fromJson(Map<String, dynamic> json) {
    return GetAllTreatMentModel(
      isAnimal: json['isAnimal'] ?? false,
      isHuman: json['isHuman'] ?? false,
      id: json['_id'] ?? '',
      treatmentTitle: json['treatmentTitle'] ?? '',
      price: json['price'] ?? 0,
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isAnimal': isAnimal,
      'isHuman': isHuman,
      '_id': id,
      'treatmentTitle': treatmentTitle,
      'price': price,
      '__v': v,
    };
  }
}