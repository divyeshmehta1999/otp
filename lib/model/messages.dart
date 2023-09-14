import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  final String senderId;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Messages(
      {required this.senderId,
      required this.receiverId,
      required this.message,
      required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'senderID': senderId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp
    };
  }
}
