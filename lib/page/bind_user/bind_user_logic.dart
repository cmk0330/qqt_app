import 'package:get/get.dart';
import 'package:qqt_app/net/Api.dart';
import 'package:qqt_app/net/request.dart';
import '../../model/bind_veteran_entity.dart';
import 'bind_user_state.dart';

class BindUserLogic extends GetxController {
  final BindUserState state = BindUserState();

  @override
  void onReady() {
    super.onReady();
    getList();
  }

  void getList() {
    netScope(() async {
      var res = await get<List<BindVeteranEntity>>(Api.GET_VETERAN_BIND_USER_LIST);
      state.recordList = res;
      update();
    });
  }
}
