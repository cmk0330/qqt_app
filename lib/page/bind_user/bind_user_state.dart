import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../entity/bind_user_entity.dart';
import '../../model/bind_veteran_entity.dart';

class BindUserState {
  List<BindVeteranEntity>? recordList = <BindVeteranEntity>[];
  Rx<Color> evenItemColor = Color(0xffeeeeee).obs;
  Rx<Color> oddItemColor = Colors.white.obs;

  BindUserState() {
    ///Initialize variables
  }
}
