import 'package:app_employe/controllers/congecontroller.dart';
import 'package:get/get.dart';

import '../UserController.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<CongeController>(CongeController(), permanent: true);
  }
}
