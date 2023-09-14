import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatscreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<String> users = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchUsers() async {
    final querySnapshot = await _firestore.collection('users').get();

    users.assignAll(querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final name = data['name'] as String;
      return name;
    }));
  }
}
