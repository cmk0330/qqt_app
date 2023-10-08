import 'dart:convert';

import 'package:dio/dio.dart';

import 'api_response/api_response_entity.dart';
import 'api_response/raw_data.dart';
import 'net_config.dart';
import 'exception.dart';

abstract class JsonConvert {
  String code = "code";
  String message = "msg";
  String data = "data";
  int? success = 0;

  JsonConvert(
      {required this.code, required this.message, required this.data, this.success});

  T? onConvert<T>(Response response);
}

class NetJsonConvert extends JsonConvert {
  NetJsonConvert(
      {required super.code, required super.message, required super.data, super.success});

  @override
  T? onConvert<T>(Response response) {
    final code = response.statusCode;
    if (code! >= 200 && code <= 299) {
      /// 请求成功
      if (T.toString() == (RawData).toString()) {
        RawData raw = RawData();
        raw.value = response.data;
        return raw as T;
      } else {
        ApiResponse<T> apiResponse = ApiResponse<T>.fromJson(response.data);
        return _handleBusinessResponse<T>(apiResponse);
      }
    } else {
      throw ApiException(code);
    }
  }

  ///业务内容处理
  T? _handleBusinessResponse<T>(ApiResponse<T> response) {
    if (response.code == NetConfig.instance.getConvert().success) {
      return response.data;
    } else {
      throw ApiException(response.code, response.message);
    }
  }
}
