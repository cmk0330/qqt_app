import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qqt_app/net/exception.dart';
import 'package:qqt_app/net/exception_handler.dart';
import 'package:qqt_app/net/request_client.dart';

RequestClient requestClient = RequestClient.instance;

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
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? headers,
}) {
  return requestClient.request(
    url,
    queryParameters: queryParameters,
    headers: headers,
  );
}

Future<T?> post<T>(
  String url, {
  data,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? headers,
}) {
  return requestClient.request(
    url,
    method: "POST",
    data: data,
    headers: headers,
    queryParameters: queryParameters,
  );
}

Future<T?> delete<T>(
  String url, {
  data,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? headers,
}) {
  return requestClient.request(
    url,
    method: "DELETE",
    data: data,
    headers: headers,
    queryParameters: queryParameters,
  );
}

Future<T?> put<T>(
  String url, {
  data,
  Map<String, dynamic>? queryParameters,
  Map<String, dynamic>? headers,
}) {
  return requestClient.request(
    url,
    method: "PUT",
    data: data,
    headers: headers,
    queryParameters: queryParameters,
  );
}
