class Order {
  final String id;
  final String userId;
  final Seller seller;
  final String type;
  final DateTime date;
  final String username;
  final String day;
  final String time;
  final ImageData image;
  final String amount;
  final String updatedamount;
  final String status;
  final String address;
  final DateTime timestamp;

  Order({
    required this.id,
    required this.updatedamount,
    required this.userId,
    required this.seller,
    required this.type,
    required this.date,
    required this.username,
    required this.day,
    required this.time,
    required this.image,
    required this.amount,
    required this.status,
    required this.address,
    required this.timestamp,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      userId: json['userId'],
      seller: Seller.fromJson(json['sellerId']),
      type: json['type'],
      date: DateTime.parse(json['date']),
      username: json['username'],
      day: json['day'],
      time: json['time'],
      image: ImageData.fromJson(json['image']),
      amount: json['amount'],
      status: json['status'],
      address: json['address'],
      timestamp: DateTime.parse(json['timestamp']),
      updatedamount: json['updatedAmount'],
    );
  }
}

class Seller {
  final String id;
  final String firstName;
  final String lastName;

  Seller({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['_id'],
      firstName: json['firstname'],
      lastName: json['lastname'],
    );
  }
}

class ImageData {
  final String type;
  final List<int> data;

  ImageData({
    required this.type,
    required this.data,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      type: json['type'],
      data: List<int>.from(json['data']),
    );
  }
}
