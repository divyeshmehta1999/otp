import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chatview_controller.dart';

class ChatviewView extends GetView<ChatviewController> {
  const ChatviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final name = Get.arguments.toString();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              name.capitalizeFirst.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
