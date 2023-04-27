
class SignupResponse {
  final String? message;
  final String? id;
  final String? error;

  SignupResponse({ this.message, this.id, this.error});

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return SignupResponse(
        error: json['error'],
      );
    } else {
      return SignupResponse(
        message: json['message'],
        id: null,
        error: null,
      );
    }
  }
}


