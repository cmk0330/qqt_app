import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qqt_app/entity/alert_record_entity.dart';

import 'alert_record_logic.dart';

class AlertRecordPage extends StatelessWidget {
  AlertRecordPage({Key? key}) : super(key: key);

  final logic = Get.find<AlertRecordLogic>();
  final state = Get.find<AlertRecordLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "报警记录",
          style: TextStyle(fontSize: 18, color: Color(0xff333333)),
        ),
        flexibleSpace: const Image(
          image: AssetImage("assets/images/ic_toolbar_bg.png"),
          fit: BoxFit.fitWidth,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 20,
              color: Color(0xff3333333),
            )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
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
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 20),
              const Text(
                "报警时间筛选",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xff9DACBB),
                          width: 0.6,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "2023年-03月",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff333333)),
                        ),
                        Image.asset(
                          "assets/images/ic_date.png",
                          scale: 3.6,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    _bottomDialog();
                  },
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "2023年03月",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          _listWidget()
        ],
      ),
    );
  }

  _listWidget() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff9DACBB), width: 0.6),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                gradient: LinearGradient(
                    colors: [Color(0xff9F8FF9), Color(0xff7970FF)])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: const SizedBox(
                      child: Text(
                        "报警类型",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "报警时间",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          GetBuilder<AlertRecordLogic>(
            assignId: true,
            builder: (logic) {
              return Container(
                height: 500,
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: ListView.builder(
                  itemCount: logic.state.list?.length,
                  itemBuilder: (context, index) {
                    if (index.isEven) {
                      logic.state.itemColor.value = const Color(0xffeeeeee);
                    } else {
                      logic.state.itemColor.value = Colors.white;
                    }
                    return _listItem(logic.state.list?[index]);
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  _listItem(AlertRecordEntity? item) {
    return Container(
      width: double.infinity,
      height: 56,
      color: logic.state.itemColor.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                child: Text(
                  "${item?.messageName}",
                  style: TextStyle(fontSize: 16, color: Color((0xff333333))),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "${item?.addTime}",
                style: TextStyle(fontSize: 16, color: Color((0xff333333))),
              ),
            ),
          )
        ],
      ),
    );
  }

  _bottomDialog() async {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      Container(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: const Text(
                    "取消",
                    style: TextStyle(fontSize: 16, color: Color(0xff999999)),
                  ),
                  onTap: () {},
                ),
                const Text(
                  "选择日期",
                  style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                ),
                GestureDetector(
                  child: const Text(
                    "确定",
                    style: TextStyle(fontSize: 16, color: Color(0xff6249E6)),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(
              height: 1,
              color: Color(0xffDDDDDD),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _dateButton("最近一周"),
                _dateButton("最近一月"),
                _dateButton("自定义"),
              ],
            ),
            TabBar(
                controller: logic.tabController,
                tabs: [Tab(text: "开始时间"), Tab(text: "结束时间")]),
            Container(
              height: 120,
              width: 300,
              child: TabBarView(
                controller: logic.tabController,
                children: [
                  CupertinoPicker(
                    itemExtent: 40,
                    onSelectedItemChanged: (state) {},
                    children: [
                      Text('Option 1'),
                      Text('Option 1'),
                      Text('Option 1'),
                      Text('Option 1'),
                    ],
                  ),
                  CupertinoPicker(
                    itemExtent: 40,
                    onSelectedItemChanged: (state) {},
                    children: [
                      Text('Option 1'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _dateButton(String text) {
    return GetBuilder<AlertRecordLogic>(builder: (build) {
      return TextButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          side: MaterialStateProperty.all(logic.state.dateStateMap[text]!
              ? BorderSide(color: Color(0xff6249E6), width: 1)
              : BorderSide(color: Color(0xffF7F7F7))),
          foregroundColor: MaterialStateProperty.all(
              logic.state.dateStateMap[text]!
                  ? Color(0xff6249E6)
                  : Color(0xff333333)),
          backgroundColor: MaterialStateProperty.all(
              logic.state.dateStateMap[text]!
                  ? Color((0xffF4F2FF))
                  : Color(0xffF7F7F7)),
        ),
        child: Text(text),
        onPressed: () {
          logic.switchState(text);
        },
      );
    });
  }
}
