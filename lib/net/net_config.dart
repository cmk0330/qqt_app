import 'package:dio/dio.dart';
import 'package:qqt_app/net/response_convert.dart';

///request config
class NetConfig {
  NetConfig._();

  static final NetConfig _instance = NetConfig._();

  static NetConfig get instance => _instance;

  String _host = "";
  int _connectTimeout = 60000;
  Map<String, dynamic> _headers = {};
  JsonConvert _convert = NetJsonConvert(
      code: "errno", message: "errmsg", data: "data", success: 0);
  List<Interceptor> _interceptors = [];

  NetConfig init(String url) {
    _host = url;
    return this;
  }

  String getHost() => _host;

  NetConfig setTimeout(int timeout) {
    _connectTimeout = timeout;
    return this;
  }

  int getTimeout() => _connectTimeout;

  NetConfig setHeaders(Map<String, dynamic> map) {
    _headers = map;
    return this;
  }

  Map<String, dynamic> getHeaders() => _headers;

  NetConfig setInterceptors(List<Interceptor> list) {
    _interceptors = list;
    return this;
  }

  NetConfig addInterceptors(List<Interceptor> list) {
    _interceptors.addAll(list);
    return this;
  }

  List<Interceptor> getInterceptors() => _interceptors;

  NetConfig setConvert(JsonConvert convert) {
    _convert = convert;
    return this;
  }

  JsonConvert getConvert() => _convert;
}
