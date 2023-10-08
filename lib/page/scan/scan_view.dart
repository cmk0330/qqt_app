import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qqt_app/routers/routers.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'scan_logic.dart';

// https://www.jianshu.com/p/e74a0f13455e
class ScanPage extends StatelessWidget {
  ScanPage({Key? key}) : super(key: key);

  final logic = Get.find<ScanLogic>();
  final state = Get
      .find<ScanLogic>()
      .state;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          children: [
            GetBuilder<ScanLogic>(
              assignId: true,
              builder: (logic) {
                return GetBuilder<ScanLogic>(
                  assignId: true,
                  builder: (logic) {
                    return QRView(
                      onQRViewCreated: _onQRViewCreated,
                      key: qrKey,
                    );
                  },
                );
              },
            ),
            Positioned(
              top: 56,
              left: 24,
              child: GestureDetector(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: FractionalTranslation(
                translation: Offset(0, -0.2),
                child: AnimatedBuilder(
                  animation: logic.controller,
                  builder: (context, child) {
                    return CustomPaint(
                      painter:
                      ScanView(linePosition: logic.controller.value * 220),
                      child: const SizedBox(height: 240, width: 240),
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    _controller?.resumeCamera();
    if (logic.state.isSuccess.value != "") {
      _controller?.stopCamera();
      _controller?.dispose();
      Get.off(RouteGet.scan);
    }
    controller.scannedDataStream.take(1).listen((result) {
      logic.state.scanCount++;
      var content = result.code?.split("?")[1];
      _editFamily(content!);
    }).onDone(() { });
  }

  void _editFamily(String content) {
    _controller?.pauseCamera();
    Get.bottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        backgroundColor: Colors.white,
        Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/images/ic_text_tag.png", scale: 3.2),
                  const SizedBox(width: 6),
                  const Text(
                    "请填写绑定信息",
                    style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                  )
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 56,
                child: TextField(
                  style: const TextStyle(
                      fontSize: 16, color: Color(0xff333333)),
                  textAlign: TextAlign.start,
                  controller: logic.state.textController,
                  decoration: InputDecoration(
                    labelText: "关系",
                    hintText: "请输入您与老干部的关系",
                    hintStyle:
                    const TextStyle(fontSize: 16, color: Color(0xff818797)),
                    prefixIcon: Image.asset(
                      "assets/images/ic_edit_user.png",
                      scale: 3.2,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(
                          color: Color(0xffCBCBCB), width: 1),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Color(0xff6249E6),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    GetX<ScanLogic>(
                      initState: (_) {},
                      builder: (logic) {
                        return TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    logic.state.btnEnable.value
                                        ? Color(0xff7970FF)
                                        : Color(0xffC4C3C3)),
                                minimumSize:
                                MaterialStateProperty.all(Size(320, 56)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12)))),
                            child: const Text(
                              "确定",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              if (!logic.state.btnEnable.value) return;
                              logic.bindVeteran(
                                  content, logic.state.textController.text);
                            });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

class ScanView extends CustomPainter {
  double linePosition = 0;
  bool repaint = false;
  int drawCount = 0;

  ScanView({required this.linePosition});

  final Paint _paint = Paint()
    ..color = Colors.greenAccent
    ..strokeWidth = 4
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  final Paint _linePaint = Paint()
    ..color = Colors.greenAccent
    ..strokeWidth = 1.2
    ..isAntiAlias = true
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0)
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size size) {
    if (drawCount == 0) {
      final point1 = [
        const Offset(0, 16),
        const Offset(0, 0),
        const Offset(0, 0),
        const Offset(16, 0),
      ];

      final point2 = [
        Offset(size.width - 16, 0),
        Offset(size.width, 0),
        Offset(size.width, 0),
        Offset(size.width, 16),
      ];

      final point3 = [
        Offset(size.width, size.height - 16),
        Offset(size.width, size.height),
        Offset(size.width, size.height),
        Offset(size.width - 16, size.height)
      ];

      final point4 = [
        Offset(16, size.height),
        Offset(0, size.height),
        Offset(0, size.height),
        Offset(0, size.height - 16)
      ];
      canvas.drawPoints(PointMode.lines, point1, _paint);
      canvas.drawPoints(PointMode.lines, point2, _paint);
      canvas.drawPoints(PointMode.lines, point3, _paint);
      canvas.drawPoints(PointMode.lines, point4, _paint);
    }
    canvas.drawLine(Offset(32, linePosition),
        Offset(size.width - 32, linePosition), _linePaint);
    drawCount = 1;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
