import 'package:get/get.dart';

import '../controllers/chatview_controller.dart';

class ChatviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatviewController>(
      () => ChatviewController(),
    );
  }
}
