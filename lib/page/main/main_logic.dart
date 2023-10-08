import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:qqt_app/entity/banner_entity.dart';
import 'package:qqt_app/entity/car_use_entity.dart';
import 'package:qqt_app/net/request.dart';
import '../../entity/food_entity.dart';
import '../../entity/login_entity.dart';
import '../../entity/refresh_token_entity.dart';
import '../../generated/json/base/json_convert_content.dart';
import '../../net/Api.dart';
import '../../util/sp_util.dart';
import 'main_state.dart';

class MainLogic extends FullLifeCycleController {
  final MainState state = MainState();

  @override
  void onReady() {
    super.onReady();
    getBanner();
  }

  void switchPage(int index) {
    state.currentIndex.value = index;
  }

  getBanner() {
    netScope(() async {
      var res = await get<List<BannerData>>(Api.GET_BANNER);
      state.bannerList.value = res!;
      update();
    });
  }

  getToken() {
    netDialogScope(() async {
      // Get.offAll(RouteGet.main);
      var loginData = await SpUtil.getString("login_entity")
          .then((value) => LoginData.fromJson(jsonDecode(value)));
      // var aaa = await get<FoodData>(Api.TEST11,
      //     headers: {"imei": 863930053654947},
      //     queryParameters: {"courtyard": 10});
      // print("food---->$aaa");
      // var aaa = await get<CarUseData>(Api.TEST);
      var token = await get<RefreshTokenEntity>(Api.GET_REFRESH_TOKEN,
          queryParameters: {"refreshToken": loginData.refreshToken});
      // var bbb = await get<CarUseData>(Api.TEST);
      // print("token--->$bbb");
    });
  }

  testRequest() {
    netScope(() async {
      var res = await get<List<BannerData>>(Api.GET_BANNER);
      print("res--->$res");
    });
  }
}
