import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:qqt_app/net/request.dart';

import '../../entity/login_entity.dart';
import '../../net/Api.dart';
import '../../routers/routers.dart';
import '../../util/sp_util.dart';
import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  Timer? countDownTimer;

  void startCount() {
    countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state.getCodeText.value = "${timer.tick}s";
      if (timer.tick == 60) {
        state.getCodeText.value = "重新获取";
        timer.cancel();
      }
      print(timer.tick);
    });
  }

  /// 获取验证码
  void getVerifyCode(String phone) {
    netScope(() async {
      final res = await get<dynamic>(Api.GET_VERIFICATION_CODE,
          queryParameters: {"phone": phone});
    });
  }

  login(String phone, String code) {
    netScope(() async {
      var res = await post<LoginData>(Api.POST_LOGIN,
          data: {"phone": phone, "code": code});
      SpUtil.setString("login_entity", jsonEncode(res));
      Get.offNamed(RouteGet.main);
    });
  }

  @override
  void onClose() {
    super.onClose();
    countDownTimer?.cancel();
    countDownTimer = null;
  }
}
