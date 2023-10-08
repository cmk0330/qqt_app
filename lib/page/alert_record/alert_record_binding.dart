import 'package:get/get.dart';

import 'alert_record_logic.dart';

class AlertRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlertRecordLogic());
  }
}
