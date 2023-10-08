import 'dart:convert';

import 'package:qqt_app/net/api_response/paging_data.g.dart';

class PagingData<T> {
  // 这些属性必须是根据业务匹配的
  int? total = 0;
  int? pages = 0;
  int? limit = 0;
  int? page = 0;
  List<T>? list;

  PagingData();

  factory PagingData.fromJson(Map<String, dynamic> json) =>
      $PagingDataFromJson<T>(json);

  Map<String, dynamic> toJson() => $PagingDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
