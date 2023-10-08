import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../entity/banner_entity.dart';

class MainState {
  var currentIndex = 0.obs;
  List<Widget> pageList = [];

  String userName = "老六";
  String versionName = "1.0.0";
  String bindVeteran = "老六他爹";
  String bindVeteranNum = "3";

  String veteranName = "老六他爹";
  String bindUsers = "2";
  RxList<BannerData> bannerList = <BannerData>[].obs;

  MainState() {}
}
