import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qqt_app/net/exception.dart';
import 'package:qqt_app/net/exception_handler.dart';
import 'package:qqt_app/net/request_client.dart';

RequestClient requestClient = RequestClient.instance;

/// 添加约束，只可以在 StatelessWidget中调用
extension NetExt on StatelessWidget {
  Future netScope1(Function() block) async {
    try {
      await block();
    } catch (e) {
      handleException(ApiException.from(e));
    }
  }
}

///  包装一层函数，用于处理异常，现在不需要了
Future netScope(Function() block) async {
  try {
    await block();
  } catch (e) {
    handleException(ApiException.from(e));
  }
}

Future netDialogScope(Function() block) async {
  try {
    EasyLoading.show(status: '加载中');
    await block();
  } catch (e) {
    handleException(ApiException.from(e));
  } finally {
    EasyLoading.dismiss();
  }
}

Future<T?> get<T>(
  String url, {
  Map<String, dynamic>? params,
  Map<String, dynamic>? headers,
}) {
  return requestClient.request(
    url,
    queryParameters: params,
    headers: headers,
  );
}

Future<T?> post<T>(
  String url, {
  data,
  Map<String, dynamic>? params,
  Map<String, dynamic>? headers,
}) {
  return requestClient.request(
    url,
    method: "POST",
    data: data,
    headers: headers,
    queryParameters: params,
  );
}

Future<T?> delete<T>(
  String url, {
  data,
  Map<String, dynamic>? params,
  Map<String, dynamic>? headers,
}) {
  return requestClient.request(
    url,
    method: "DELETE",
    data: data,
    headers: headers,
    queryParameters: params,
  );
}

Future<T?> put<T>(
  String url, {
  data,
  Map<String, dynamic>? params,
  Map<String, dynamic>? headers,
}) {
  return requestClient.request(
    url,
    method: "PUT",
    data: data,
    headers: headers,
    queryParameters: params,
  );
}

// Future<T?> download<T>(
//   String url,
//   String path, {
//   data,
//   Map<String, dynamic>? params,
//   Map<String, dynamic>? headers,
// }) {
//   return requestClient.download(
//     url,
//     path,
//     progressCallback,
//     method: "Get",
//     data: data,
//     headers: headers,
//     queryParameters: params,
//   );
// }

extension ResponseExt<File> on Response<File> {
  onProgress() {}
}
