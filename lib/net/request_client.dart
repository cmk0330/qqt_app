import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:qqt_app/net/net_config.dart';
import 'package:qqt_app/net/token_interceptor.dart';

class RequestClient {
  static RequestClient? _instance;
  late Dio _dio;
  late BaseOptions _baseOptions;
  final _config = NetConfig.instance;
  int count = 0;

  static get instance => _instance ?? RequestClient();

  RequestClient() {
    _instance = this;
    count++;
    _baseOptions = BaseOptions(
        baseUrl: _config.getHost(),
        connectTimeout: _config.getTimeout(),
        headers: _config.getHeaders());
    _dio = Dio(_baseOptions);
    _dio.interceptors.addAll(_config.getInterceptors());
    print("初始化了----$count");
  }

  Future<T?> request<T>(
    String url, {
    String method = "Get",
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    data,
  }) async {
    Options options = Options()
      ..method = method
      ..headers = headers;
    if (url.contains("http") || url.contains("https")) {
      _baseOptions.baseUrl = '';
    } else {
      _baseOptions.baseUrl = _config.getHost();
    }
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    Response response = await _dio.request(url,
        queryParameters: queryParameters, data: data, options: options);
    return _config.getConvert().onConvert(response);
  }
}
