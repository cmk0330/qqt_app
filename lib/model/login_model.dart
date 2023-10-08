import 'dart:io';

class LoginModel {



  // // 获取验证码
  //  Future<ApiResponse<String>> getVerifyCode(String phone) async {
  //   try {
  //     var res = await HttpUtils.get(Api.GET_VERIFICATION_CODE,
  //         params: {"phone": phone});
  //     print("LoginModel-->$res");
  //     return ApiResponse.completed(res);
  //   } on DioError catch (e) {
  //     return ApiResponse.error(e.error);
  //   }
  // }
  //
  // // 登录
  //  Future<ApiResponse<LoginEntity>> login(
  //     String phone, String code) async {
  //   try {
  //     var res = await HttpUtils.post(Api.POST_LOGIN,
  //         params: {"phone": phone, "code": code});
  //     var entity = LoginEntity.fromJson(res);
  //     return ApiResponse.completed(entity);
  //   } on DioError catch (e) {
  //     return ApiResponse.error(e.error);
  //   }
  // }
}
