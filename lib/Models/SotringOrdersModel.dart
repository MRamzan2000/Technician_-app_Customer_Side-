class ResponseModel {
  final String? message;
  final String? status;

  ResponseModel({ this.message, this. status});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    if(json.containsKey('status')){
      return ResponseModel(
        status: json['status'],
      );
    }
    return ResponseModel(
      message: json['message'],
    );
  }
}