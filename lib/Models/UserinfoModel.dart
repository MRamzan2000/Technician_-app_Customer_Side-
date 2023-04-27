class User {
  final String? message;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? city;
  final String? dateOfBirth;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.message,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.city,
    this.dateOfBirth,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    if(json.containsKey('message')){
      return User(
        message: json['message']
      );
    }
    return User(
      id: json['_id'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      email: json['email'],
      phoneNumber: json['phonenumber'],
      city: json['city'],
      dateOfBirth: json['dateofbirth'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
