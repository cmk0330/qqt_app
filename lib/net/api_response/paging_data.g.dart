import 'package:qqt_app/net/api_response/paging_data.dart';

import '../../generated/json/base/json_convert_content.dart';

PagingData<T> $PagingDataFromJson<T>(Map<String, dynamic> json) {
  var type = T.toString();
  final pagingData = PagingData<T>();
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    pagingData.page = page;
  }
  final int? pages = jsonConvert.convert<int>(json['pages']);
  if (pages != null) {
    pagingData.pages = pages;
  }
  final int? limit = jsonConvert.convert<int>(json['limit']);
  if (limit != null) {
    pagingData.limit = limit;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    pagingData.total = total;
  }
  final List<T>? list = jsonConvert.convertListNotNull<T>(json['list']);
  if (list != null) {
    pagingData.list = list;
  }
  return pagingData;
}

Map<String, dynamic> $PagingDataToJson(PagingData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['page'] = entity.page;
  data['pages'] = entity.pages;
  data['list'] = entity.list;
  data['total'] = entity.total;
  return data;
}

M? pagingDataFromJsonSingle<M>(Map<String, dynamic> json) {
  String type = M.toString();
  String genericType = type.substring(type.indexOf("<") + 1, type.length - 1);
  print("genericType :$genericType");

  var aaa = PagingData.fromJson(json);
  return aaa as M;
}
