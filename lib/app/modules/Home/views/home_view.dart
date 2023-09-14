import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otptestdelete/app/modules/chatscreen/views/chatscreen_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    print(controller.name);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        children: [
          Text('Enter Your Name'),
          TextFormField(
            onChanged: (value) => controller.name.value = value,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          Text('enter your password'),
          TextFormField(
            onChanged: (value) => controller.password.value = value,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextButton(
              onPressed: () {
                controller.saveUserDetails().then((_) {
                  Get.off(ChatscreenView());
                  print('User details saved successfully.');
                }).catchError((error) {
                  print('Error saving user details: $error');
                });
              },
              child: Text('Submit'))
        ],
      )),
    );
  }
}
