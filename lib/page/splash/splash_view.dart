import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final logic = Get.find<SplashLogic>();
  final state = Get.find<SplashLogic>().state;

  @override
  Widget build(BuildContext context) {
    logic.toString();
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/ic_splash_logo.png",
              scale: 6,
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "青岛九明珠信息技术有限公司",
                style: TextStyle(fontSize: 14, color: Color(0xff818797)),
              ),
            )
          ],
        ));
  }
}
