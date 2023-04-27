
class SignInResponse {
  final String? userId;
  final String? token;
  final String? message;

  SignInResponse({ this.userId, this.token,this.message});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      return SignInResponse(
        userId: json['id'],
        token: json['token'],
        message: json['message'],
      );
    } else {
      return SignInResponse(
        message: json['message'],
      );
    }
  }
}


