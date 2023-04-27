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
      message.receiverId = receiverId;
      messages.add(message);
    }

    return LastMessages(messages: messages);
  }
}

class Message {
  final String? id;
  final String? text;
  final int? createdAt;
  String? receiverId;

  Message({this.id, this.text, this.createdAt});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      text: json['text'],
      createdAt: int.parse(json['createdAt']),
    );
  }
}