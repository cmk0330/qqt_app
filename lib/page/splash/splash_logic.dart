import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routers/routers.dart';
import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onReady() async {
    super.onReady();
    var sp = await SharedPreferences.getInstance();
    if (!sp.containsKey("login_entity")) {
      Get.offAndToNamed(RouteGet.login);
    } else {
      Get.offAndToNamed(RouteGet.main);
    }
  }
}
