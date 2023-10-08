import 'package:get/get.dart';

import 'bind_user_logic.dart';

class BindUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BindUserLogic());
  }
}
