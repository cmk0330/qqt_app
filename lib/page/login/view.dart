import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qqt_app/routers/routers.dart';

import '../../entity/login_entity.dart';
import '../../net/Api.dart';
import '../../net/request.dart';
import '../../util/sp_util.dart';
import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          textDirection: TextDirection.ltr,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(),
              child: Image.asset("assets/images/ic_login_bg.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 24),
                    child: Text(
                      "欢迎注册亲情通！",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 6, left: 24),
                    child: Text(
                      "输入手机号进行快捷注册",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff818797),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    padding:
                        const EdgeInsets.only(left: 16, top: 24, right: 16),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff333333),
                      ),
                      decoration: InputDecoration(
                          labelText: "手机号",
                          hintText: "请输入手机号",
                          hintStyle: const TextStyle(
                              fontSize: 16, color: Color(0xff818797)),
                          prefixIcon: Image.asset(
                            "assets/images/ic_phone_num.png",
                            scale: 3.6,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Color(0xffCBCBCB),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Color(0xff6249E6),
                            ),
                          )),
                      onChanged: (text) {
                        state.phone = text;
                      },
                    ),
                  ),
                  Container(
                    height: 80,
                    padding:
                        const EdgeInsets.only(left: 16, top: 24, right: 16),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff333333),
                          ),
                          decoration: InputDecoration(
                            labelText: "验证码",
                            hintText: "请输入验证码",
                            hintStyle: const TextStyle(
                                fontSize: 16, color: Color(0xff818797)),
                            prefixIcon: Image.asset(
                              "assets/images/ic_verify_code.png",
                              scale: 3.6,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                color: Color(0xffCBCBCB),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide: BorderSide(
                                color: Color(0xff6249E6),
                              ),
                            ),
                          ),
                          focusNode: state.textFocusNode,
                          onChanged: (text) {
                            state.verifyCode = text;
                          },
                        ),
                        Positioned(
                          right: 8,
                          child: Obx(() {
                            return TextButton(
                              child: Text(
                                state.getCodeText.value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff6249E6),
                                ),
                              ),
                              onPressed: () {
                                if (state.getCodeText.value == "获取验证码" ||
                                    state.getCodeText.value == "重新获取") {
                                  FocusScope.of(context)
                                      .requestFocus(state.textFocusNode);
                                  logic.startCount();
                                  logic.getVerifyCode(state.phone);
                                }
                              },
                            );
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(40),
            height: 56,
            // width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gradient: LinearGradient(
                colors: [Color(0xffA190F9), Color(0xff4D76FF)],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  "登录",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Image.asset(
                      "assets/images/ic_login_enter.png",
                      scale: 3.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () async {
            logic.login(logic.state.phone, logic.state.verifyCode);
          },
        )
      ],
    );
  }
}
