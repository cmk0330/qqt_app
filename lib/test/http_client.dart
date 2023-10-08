import 'dart:io';

import 'package:dio/dio.dart';

// https://cloud.tencent.com/developer/article/2124693
class HttpClient {
  var dio = Dio();

  HttpClient(){

  }

  void test() async {
    var aa = await dio.get("");
  }
}