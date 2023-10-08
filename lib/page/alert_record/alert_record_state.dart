import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:qqt_app/entity/alert_record_entity.dart';

class AlertRecordState {
  Rx<Color> itemColor = Colors.white.obs;
  List<AlertRecordEntity>? list = [];
  Map<String, bool> dateStateMap = {"最近一周": false, "最近一月": false, "自定义": false};
  List<Widget> tabs = [Tab(text: "开始时间"), Tab(text: "结束时间")];
  late String startDate;
  late String endDate;

  AlertRecordState() {
    final format = DateFormat('yyyy-MM-dd');
    final currMil =
        DateTime.fromMillisecondsSinceEpoch(DateTime.now().microsecond);
    startDate = format.format(currMil);
    endDate = format.format(currMil);

    ///Initialize variables
  }
}
