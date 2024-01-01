import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_shooter_workshop/screens/login/login_controller.dart';
import 'package:space_shooter_workshop/screens/register/register_controller.dart';
// import 'package:modul_4_prak/app/modules/Login/controllers/login_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }
}
