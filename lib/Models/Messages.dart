import 'dart:convert';
import 'package:http/http.dart' as http;

class LastMessages {
  final List<Message> messages;

  LastMessages({required this.messages});

  factory LastMessages.fromJson(Map<String, dynamic> json) {
    final List<Message> messages = [];

    for (final messageJson in json['lastMessages']) {
      final message = Message.fromJson(messageJson);
      final receiverId = messageJson['receiverId'];
      final receiverName = messageJson["receiverName"];
      message.receiverName = receiverName;
      message.receiverId = receiverId;
      messages.add(message);
    }

    return LastMessages(messages: messages);
  }
}

class Message {
  final String? id;
  final String? text;
  final String? createdAt;
  String? receiverName;
  String? receiverId;

  Message({this.id, this.text, this.createdAt,this.receiverName});

  factory Message.fromJson(Map<String, dynamic> json) {
    print("Json data : " +  json.toString());
if(json.containsKey('text')){
  print("object");
  return Message(
    id: json['_id'],
    text: json['text'],
    createdAt: json['createdAt'],
    receiverName: json['receiverName'], // set receiverName property here
  );
}
    return Message(
      id: json['_id'],
      createdAt: (json['createdAt']),
      receiverName: json['receiverName'], // set receiverName property here
    );
  }

}