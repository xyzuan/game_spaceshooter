import 'package:get/get.dart';
import 'package:space_shooter_workshop/screens/title/title_controller.dart';

class TitleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TitleController>(
      TitleController(),
    );
  }
}
