import 'package:flux_test/controller/chat_controller.dart';
import 'package:get/instance_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
  }
}
