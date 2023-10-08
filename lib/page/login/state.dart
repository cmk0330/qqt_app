import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginState {
  FocusNode textFocusNode = FocusNode();
  Rx<String> getCodeText = "获取验证码".obs;
  late String phone;
  late String verifyCode;
  bool isLogin = false;

  LoginState() {}
}
