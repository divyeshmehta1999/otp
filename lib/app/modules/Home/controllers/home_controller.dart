import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final name = ''.obs;
  final password = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserDetails() async {
    if (name.value.isEmpty || password.value.isEmpty) {
      // Validation failed
      Get.snackbar(
        'Validation Error',
        'Please fill in all fields.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      await _firestore.collection('users').add({
        'name': name.value,
        'password': int.parse(password.value),

        // Add more fields as needed
      });
      Get.snackbar(
        'Success',
        'User details saved to Firestore.',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Clear the form
      name.value = '';
      password.value = '';
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Error saving user details: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
