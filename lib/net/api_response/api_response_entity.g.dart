import 'package:qqt_app/net/api_response/paging_data.g.dart';
import 'package:qqt_app/net/net_config.dart';

import '../../generated/json/base/json_convert_content.dart';
import 'api_response_entity.dart';

ApiResponse<T> $ApiResponseFromJson<T>(Map<String, dynamic> json) {
  final codeAttr = NetConfig.instance.getConvert().code;
  final messageAttr = NetConfig.instance.getConvert().message;
  final dataAttr = NetConfig.instance.getConvert().data;

  final ApiResponse<T> apiResponseEntity = ApiResponse<T>();
  final int? code = jsonConvert.convert<int>(json[codeAttr]);
  if (code != null) {
    apiResponseEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json[messageAttr]);
  if (msg != null) {
    apiResponseEntity.message = msg;
  }
  String type = T.toString();
  T? data;
  if (json[dataAttr] != null) {
    if (type.startsWith("PagingData<")) {
      data = pagingDataFromJsonSingle<T>(json[dataAttr]);
    } else {
      data = jsonConvert.convert<T>(json[dataAttr]);
    }
  }
  if (data != null) {
    apiResponseEntity.data = data;
  }
  return apiResponseEntity;
}

Map<String, dynamic> $ApiResponseToJson(ApiResponse entity) {
  final codeAttr = NetConfig.instance.getConvert().code;
  final messageAttr = NetConfig.instance.getConvert().message;
  final dataAttr = NetConfig.instance.getConvert().data;

  final Map<String, dynamic> data = <String, dynamic>{};
  data[codeAttr] = entity.code;
  data[messageAttr] = entity.message;
  data[dataAttr] = entity.data;
  return data;
}
