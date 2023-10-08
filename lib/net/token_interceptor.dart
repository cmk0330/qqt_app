import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:qqt_app/entity/login_entity.dart';
import 'package:qqt_app/entity/refresh_token_entity.dart';
import 'package:qqt_app/net/Api.dart';
import 'package:qqt_app/net/request.dart';

import '../util/sp_util.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (await SpUtil.containsKey("login_entity")) {
      var token = await SpUtil.getString("login_entity")
          .then((value) => LoginData.fromJson(jsonDecode(value)))
          .then((value) => value.token);
      options.headers["token"] = token;
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(dio.DioError err, dio.ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    if (err.response?.statusCode == 413) {
      // token过期
      var loginData = await SpUtil.getString("login_entity")
          .then((value) => LoginData.fromJson(jsonDecode(value)));
      var tokenEntity = await get<RefreshTokenEntity>(Api.GET_REFRESH_TOKEN,
          queryParameters: {"refreshToken": loginData.refreshToken});
      loginData.token = tokenEntity?.token;
      loginData.refreshToken = tokenEntity?.refreshToken;

      SpUtil.setString("login_entity", jsonEncode(loginData));
      err.requestOptions.headers["token"] = loginData.token;
      await requestClient.request(err.requestOptions.path,
          queryParameters: err.requestOptions.queryParameters,
          method: err.requestOptions.method,
          data: err.requestOptions.data,
          headers: err.requestOptions.headers);
    }
  }
}
