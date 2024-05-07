import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:qqt_app/net/net_config.dart';
import 'package:qqt_app/net/request.dart';
import 'package:qqt_app/net/response_convert.dart';
import 'package:qqt_app/routers/routers.dart';

import 'net/token_interceptor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    netScope1((){});
    _initNet();
    _initLoading();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            getPages: RouteGet.getPages,
            initialRoute: RouteGet.launch,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            builder: EasyLoading.init(),
          );
        });
  }

  void _initNet() {
    final interceptors = [
      TokenInterceptor(),
      PrettyDioLogger(requestHeader: true, requestBody: true)
    ];
    NetConfig.instance
        .init("https://console.sdhis999.com/")
        .setTimeout(60000)
        .setInterceptors(interceptors)
        .setConvert(
          NetJsonConvert(
              code: "errno", message: "errmsg", data: "data", success: 0),
        );
  }

  void _initLoading() {
    // EasyLoading.instance
      // ..indicatorType = EasyLoadingIndicatorType.threeBounce;  // 加载类型
      // ..loadingStyle = EasyLoadingStyle.light  // 加载样式
      // ..indicatorSize = 32.0   // 大小
      // ..maskType = EasyLoadingMaskType.clear // 遮罩
      // ..userInteractions = true  // 使用单例模式
      // ..dismissOnTap = false;  // 指示器结束的点击时间
  }
}
