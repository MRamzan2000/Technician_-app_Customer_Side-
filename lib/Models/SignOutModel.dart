class LogOutModel {
  final String? message;
  final String? error;

  LogOutModel({ this.error,this.message,});

  factory LogOutModel.fromJson(Map<String, dynamic> json) {
    if(json.containsKey('error')){
      return LogOutModel(
        error: json['error'],
      );
    }
    return LogOutModel(
      message: json['message'],
    );
  }
}