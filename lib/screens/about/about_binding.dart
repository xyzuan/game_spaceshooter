import 'package:get/get.dart';
import 'package:space_shooter_workshop/screens/about/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AboutController>(
      AboutController(),
    );
  }
}
