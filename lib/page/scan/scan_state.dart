import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ScanState {
  final textController = TextEditingController();
  final btnEnable = false.obs;
  String resultContent = "";
  var isSuccess = "".obs;
  int scanCount = 0; // 获得扫描结果次数
  Rx<bool> isDialogShow = false.obs; // 弹窗是否弹起

  ScanState() {
    ///Initialize variables
  }
}
