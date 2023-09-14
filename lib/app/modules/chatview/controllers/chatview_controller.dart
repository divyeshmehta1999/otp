import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:otptestdelete/model/messages.dart';

class ChatviewController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final Timestamp timestamp = Timestamp.now();
  Future<void> sendMessage(String reciverId, String message) async {
    final String currenUserId = _firebaseAuth.currentUser!.uid;
    Messages newMessage = Messages(
        senderId: currenUserId,
        receiverId: reciverId,
        message: message,
        timestamp: timestamp);
    List<String> ids = [currenUserId, reciverId];
    String chatRoomId = ids.join();
  }
}
