import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otptestdelete/app/modules/chatview/views/chatview_view.dart';

import '../controllers/chatscreen_controller.dart';

class ChatscreenView extends GetView<ChatscreenController> {
  const ChatscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ChatscreenController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatscreenView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Container(
                height: 200,
                width: 200,
                child: ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final user = controller.users[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(ChatviewView(), arguments: [user]);
                      },
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          child: Text(user),
                        ),
                      ),
                    );
                  },
                ),
              )),
          TextButton(
              onPressed: () async {
                await controller.fetchUsers();
                print(controller.users);
              },
              child: Text('getdata'))
        ],
      ),
    );
  }
}
