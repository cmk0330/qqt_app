import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qqt_app/net/request.dart';
import 'package:qqt_app/net/request_client.dart';

import '../../entity/alert_record_entity.dart';
import '../../net/Api.dart';
import 'alert_record_state.dart';

class AlertRecordLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AlertRecordState state = AlertRecordState();
  TabController? tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: state.tabs.length);
    tabController?.addListener(() {
      ///避免addListener调用2次
      if (tabController?.index == tabController?.animation?.value) {
        print("点击了下标为${tabController?.index}的tab");
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    getRecord("", "", "");
  }

  getRecord(String? dateType, String? startTime, String? endTime) async {
    netScope(() async {
      var res = await get<List<dynamic>>(Api.GET_ALERT_RECORD,
          queryParameters: {
            "dateType": dateType,
            "startTime": startTime,
            "endTime": endTime
          });
      var list = res?.map((e) => AlertRecordEntity.fromJson(e)).toList();
      var listTemp = <AlertRecordEntity>[];
      listTemp.addAll(list!);
      listTemp.addAll(list);
      state.list = listTemp;
      update();
    });
  }

  void switchState(String text) {
    for (var element in state.dateStateMap.keys) {
      state.dateStateMap[element] = text == element;
    }
    update();
  }
}
