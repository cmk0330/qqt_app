import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qqt_app/model/bind_veteran_entity.dart';

import 'bind_user_logic.dart';

class BindUserPage extends StatelessWidget {
  BindUserPage({Key? key}) : super(key: key);

  final logic = Get.find<BindUserLogic>();
  final state = Get.find<BindUserLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "已绑定用户",
          style: TextStyle(fontSize: 18, color: Color(0xff333333)),
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
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 32, right: 16),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 4),
                Image.asset(
                  "assets/images/ic_text_tag.png",
                  scale: 3.2,
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "用户绑定信息",
                    style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
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
                              "用户名",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "与被绑定人关系",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints:
                      BoxConstraints.loose(const Size(360, double.infinity)),
                  child: Container(
                    padding: const EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        border: Border.all(
                            width: 0.6, color: const Color(0xff9DACBB))),
                    child: GetBuilder<BindUserLogic>(
                      builder: (build) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: logic.state.recordList?.length,
                            itemBuilder: (context, index) {
                              final itemColor = index.isEven
                                  ? logic.state.evenItemColor.value
                                  : logic.state.oddItemColor.value;
                              return _listItem(
                                  logic.state.recordList![index], itemColor);
                            });
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _listItem(BindVeteranEntity? item, Color color) {
    return Container(
      height: 56,
      color: color,
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "${item?.username}",
                style: TextStyle(fontSize: 16, color: Color(0xff333333)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "",
                style: TextStyle(fontSize: 16, color: Color(0xff333333)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
