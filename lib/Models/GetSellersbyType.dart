class Seller {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? phoneNumber;
  String? city;
  String? dateOfBirth;
  String? idOfIqama;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? token;
  String? type;

  Seller({
     this.id,
     this.firstname,
     this.lastname,
     this.email,
     this.password,
     this.phoneNumber,
     this.city,
     this.dateOfBirth,
     this.idOfIqama,
     this.createdAt,
     this.updatedAt,
     this.v,
     this.type,
    this.token,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    print(json);
    return Seller(
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phonenumber'],
      city: json['city'],
      dateOfBirth: json['dateofbirth'],
      idOfIqama: json['idofiqama'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v']?? " ",
      token: json['token']?? " ",
      type: json['type']?? " ",
    );
  }
}

class SellersResponse {
  List<Seller>? sellers;

  SellersResponse({ this.sellers});

  factory SellersResponse.fromJson(Map<String, dynamic> json) {
    final sellersJson = json['sellers'] as List<dynamic>;
    final List<Seller> sellers =
    sellersJson.map((sellerJson) => Seller.fromJson(sellerJson)).toList();
    return SellersResponse(sellers: sellers);
  }
}
