import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qqt_app/routers/routers.dart';

import 'main_logic.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final logic = Get.find<MainLogic>();
  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    state.pageList.add(_homePage());
    state.pageList.add(_minePage());
    return Scaffold(
      body: Obx(() => logic.state.pageList[logic.state.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: state.currentIndex.value,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xff2b2a4b),
            unselectedItemColor: const Color(0xffcdd4db),
            items: const [
              BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "我的", icon: Icon(Icons.person)),
            ],
            onTap: (index) {
              logic.switchPage(index);
            },
          )),
    );
  }

  _homePage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage("assets/images/ic_main_bg.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            const SizedBox(height: 56),
            const Text("首页",
                style: TextStyle(color: Color(0xff333333), fontSize: 18)),
            const SizedBox(height: 24),
            Row(
              children: [
                const SizedBox(width: 24),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage("assets/images/ic_default_avatar.png"),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.veteranName,
                      style: const TextStyle(
                          fontSize: 18, color: Color(0xff333333)),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "当前已绑定用户数：${state.bindUsers} 人",
                      style: const TextStyle(
                          fontSize: 14, color: Color(0xff58637B)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 80,
              margin: const EdgeInsets.only(left: 24, right: 24),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/ic_call_bg.png"),
                    fit: BoxFit.scaleDown),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Row(
                      children: [
                        Image.asset("assets/images/ic_call_video.png",
                            scale: 3.2),
                        const SizedBox(width: 8),
                        const Text(
                          "视频通话",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff333333)),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        Image.asset("assets/images/ic_call_audio.png",
                            scale: 3.2),
                        const SizedBox(width: 8),
                        const Text(
                          "语音通话",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff333333)),
                        )
                      ],
                    ),
                    onTap: () {
                      // logic.getBanner();
                      logic.getToken();
                      // logic.testRequest();
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              padding: const EdgeInsets.all(24),
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/ic_main_shortcut.png"),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/ic_text_tag.png",
                        scale: 3,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "快捷服务",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff333333),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffCFD8DB),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, top: 24),
                                child: const Text(
                                  "报警记录",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xff333333)),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 16, top: 6),
                                child: const Text(
                                  "Record",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xff7D879D)),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Center(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    "assets/images/ic_call_record.png",
                                    width: 96,
                                    height: 96,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(RouteGet.alertRecord);
                        },
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        child: Container(
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffCFD8DB),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, top: 24),
                                child: const Text(
                                  "亲子绑定",
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xff333333)),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 16, top: 6),
                                child: const Text(
                                  "Service",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xff7D879D)),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Center(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    "assets/images/ic_fimaly_bind.png",
                                    width: 96,
                                    height: 96,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          var result = await Get.toNamed(RouteGet.scan);
                          if (result["code"] != null) {
                            // String code = result["code"];
                            // var content = code.split("?")[1];
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 320,
              height: 160,
              child: GetBuilder<MainLogic>(
                builder: (controller) {
                  return PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: logic.state.bannerList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        logic.state.bannerList[index].url!,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _minePage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage("assets/images/ic_mine_bg.png"),
            fit: BoxFit.fitWidth),
      ),
      child: Column(
        children: [
          const SizedBox(height: 56),
          const Text(
            "我的",
            style: TextStyle(fontSize: 18, color: Color(0xff333333)),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const SizedBox(width: 24),
              CircleAvatar(
                radius: 35,
                child: Image.asset("assets/images/ic_default_avatar.png"),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.userName,
                    style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "已绑定老干部${state.bindVeteran}",
                    style: TextStyle(fontSize: 14, color: Color(0xff58637B)),
                  )
                ],
              ),
              const SizedBox(width: 24),
              Row(
                children: [
                  Image.asset("assets/images/ic_edit_name.png", scale: 4.6),
                  const SizedBox(width: 6),
                  const Text(
                    "编辑",
                    style: TextStyle(fontSize: 12, color: Color(0xff58637B)),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 12, top: 20, right: 12, bottom: 16),
            margin: const EdgeInsets.only(left: 12, top: 24, right: 12),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffeeeeee),
                      blurRadius: 8.0,
                      offset: Offset(1.6, 1.6))
                ]),
            child: Column(
              children: [
                GestureDetector(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    textDirection: TextDirection.ltr,
                    children: [
                      Image.asset("assets/images/ic_about_us.png", scale: 3.2),
                      const Positioned(
                        left: 40,
                        child: Text(
                          "关于我们",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff333333)),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffCBCBCB),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xffDDDDDD),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    textDirection: TextDirection.ltr,
                    children: [
                      Image.asset("assets/images/ic_contact_us.png",
                          scale: 3.2),
                      const Positioned(
                        left: 40,
                        child: Text(
                          "联系客服",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff333333)),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffCBCBCB),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xffDDDDDD),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    textDirection: TextDirection.ltr,
                    children: [
                      Image.asset("assets/images/ic_login_out.png", scale: 3.2),
                      const Positioned(
                        left: 40,
                        child: Text(
                          "退出登录",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff333333)),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffCBCBCB),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _logoutDialog();
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xffDDDDDD),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    textDirection: TextDirection.ltr,
                    children: [
                      Image.asset("assets/images/ic_version_code.png",
                          scale: 3.2),
                      const Positioned(
                        left: 40,
                        child: Text(
                          "版本号",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff333333)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          state.versionName,
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xff999999)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xffDDDDDD),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteGet.bindUser);
                  },
                  child: Stack(
                    textDirection: TextDirection.ltr,
                    children: [
                      Image.asset("assets/images/ic_version_code.png",
                          scale: 3.2),
                      const Positioned(
                        left: 40,
                        child: Text(
                          "已绑定用户",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff333333)),
                        ),
                      ),
                      Positioned(
                        right: 24,
                        child: Text(
                          "${state.bindVeteranNum}人",
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xff999999)),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffCBCBCB),
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _logoutDialog() {
    Get.defaultDialog(
      title: "您确认要退出登陆",
      backgroundColor: Color(0xff333333),
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/ic_warn.png",
                scale: 3.2,
              ),
              const SizedBox(width: 8),
              const Text(
                "您确认要退出登陆？",
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 110,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xffF7F7F7)),
                  child: const Text(
                    "确定",
                    style: TextStyle(fontSize: 16, color: Color(0xff6249E6)),
                  ),
                ),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 110,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xff7970FF)),
                  child: const Text(
                    "确定",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
