import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qqt_app/net/request.dart';

import '../../net/Api.dart';
import '../../net/request_client.dart';
import 'scan_state.dart';

class ScanLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final ScanState state = ScanState();
  late AnimationController controller;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat()
      ..addListener(() {});
  }

  @override
  void onReady() {
    super.onReady();
    editListener();
  }

  void editListener() {
    state.textController.addListener(() {
      if (state.textController.text.isEmpty) {
        state.btnEnable.value = false;
      } else {
        state.btnEnable.value = true;
      }
    });
  }

  bindVeteran(String code, String ship) {
    netScope(() async {
      var res = await post<Locale>(Api.POST_VETERAN_QR_BIND,
          data: {"qrCode": code, "relationship": ship});
      state.isSuccess.value = "success";
      update();
      print("-----------");
    });
  }

  @override
  void onClose() {
    controller.dispose();
    print("onclose---->");
    super.onClose();
  }
}
