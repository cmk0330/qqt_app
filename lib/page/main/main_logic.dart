import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:qqt_app/entity/banner_entity.dart';
import 'package:qqt_app/net/request.dart';
import '../../entity/car_use_entity.dart';
import '../../entity/login_entity.dart';
import '../../entity/refresh_token_entity.dart';
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

  getBanner() async {
    var res = await get<List<BannerData>>(Api.GET_BANNER);
    state.bannerList.value = res!;
    update();
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
          params: {"refreshToken": loginData.refreshToken});
      var bbb = await get<CarUseData>(Api.TEST);
      print("token--->$bbb");
    });
  }

  testRequest() async {
    netScope(() async {
      var res = await get<BannerData>(Api.GET_BANNER);
      print(res);
    });



    // netScope(() async {
    //   // var loginData = await SpUtil.getString("login_entity")
    //   //     .then((value) => LoginData.fromJson(jsonDecode(value)));
    //   // var token = await get<RefreshTokenEntity>(Api.GET_REFRESH_TOKEN,
    //   //     params: {"refreshToken": loginData.refreshToken});
    //   var res = await get<List<WanAndroidData>>(Api.WAN_AN_ZHUO);
    //   var list = <WanAndroidDataDatas>[];
    //   // for (var e in res) {
    //   //   var tags = WanAndroidDataDatasTags.fromJson(e['tags']);
    //   //   var datas = WanAndroidDataDatas.fromJson(e);
    //   //   datas.tags.add(tags);
    //   //   list.add(datas);
    //   // }
    //   print("token--->$list");
    //   // var res = await get<List<BannerData>>(Api.GET_BANNER);
    //   // print("res--->$res");
    // });
  }
}
