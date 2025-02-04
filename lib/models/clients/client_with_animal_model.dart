class GetClientWithAnmialModel {
  final List<String>? clientIds;
  final List<ClientDetail>? clientDetails;

  GetClientWithAnmialModel({
    this.clientIds,
    this.clientDetails,
  });

  factory GetClientWithAnmialModel.fromJson(Map<String, dynamic> json) => GetClientWithAnmialModel(
    clientIds: json["clientIds"] == null ? [] : List<String>.from(json["clientIds"]!.map((x) => x)),
    clientDetails: json["clientDetails"] == null ? [] : List<ClientDetail>.from(json["clientDetails"]!.map((x) => ClientDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "clientIds": clientIds == null ? [] : List<dynamic>.from(clientIds!.map((x) => x)),
    "clientDetails": clientDetails == null ? [] : List<dynamic>.from(clientDetails!.map((x) => x.toJson())),
  };
}

class ClientDetail {
  final Address? address;
  final String? id;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? other;
  final int? v;
  final bool? humanClient;

  ClientDetail({
    this.address,
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.other,
    this.v,
    this.humanClient,
  });

  factory ClientDetail.fromJson(Map<String, dynamic> json) => ClientDetail(
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
