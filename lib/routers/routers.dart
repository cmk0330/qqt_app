import 'package:get/get.dart';
import 'package:qqt_app/page/alert_record/alert_record_binding.dart';
import 'package:qqt_app/page/alert_record/alert_record_view.dart';
import 'package:qqt_app/page/bind_user/bind_user_binding.dart';
import 'package:qqt_app/page/bind_user/bind_user_view.dart';
import 'package:qqt_app/page/login/binding.dart';
import 'package:qqt_app/page/main/main_binding.dart';
import 'package:qqt_app/page/main/main_view.dart';
import 'package:qqt_app/page/scan/scan_binding.dart';
import 'package:qqt_app/page/splash/splash_binding.dart';
import 'package:qqt_app/page/splash/splash_view.dart';

import '../page/login/view.dart';
import '../page/scan/scan_view.dart';

class RouteGet {
  ///root page

  static const String launch = "/";
  static const String login = "/login";
  static const String main = "/main";
  static const String bindUser = "/bind_user";
  static const String alertRecord = "/alertRecord";
  static const String scan = "/qr_scan";

  ///pages map
  static final List<GetPage> getPages = [
    GetPage(name: launch, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: login, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: main, page: () => MainPage(), binding: MainBinding()),
    GetPage(
        name: bindUser, page: () => BindUserPage(), binding: BindUserBinding()),
    GetPage(
        name: alertRecord,
        page: () => AlertRecordPage(),
        binding: AlertRecordBinding()),
    GetPage(name: scan, page: () => ScanPage(), binding: ScanBinding())
  ];
}
