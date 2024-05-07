import 'package:qqt_app/generated/json/base/json_convert_content.dart';
import 'package:qqt_app/model/bind_veteran_entity.dart';

BindVeteranEntity $BindVeteranEntityFromJson(Map<String, dynamic> json) {
  final BindVeteranEntity bindVeteranEntity = BindVeteranEntity();
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    bindVeteranEntity.avatar = avatar;
  }
  final String? familialName = jsonConvert.convert<String>(
      json['familialName']);
  if (familialName != null) {
    bindVeteranEntity.familialName = familialName;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    bindVeteranEntity.id = id;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    bindVeteranEntity.username = username;
  }
  final int? veteranId = jsonConvert.convert<int>(json['veteranId']);
  if (veteranId != null) {
    bindVeteranEntity.veteranId = veteranId;
  }
  return bindVeteranEntity;
}

Map<String, dynamic> $BindVeteranEntityToJson(BindVeteranEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['avatar'] = entity.avatar;
  data['familialName'] = entity.familialName;
  data['id'] = entity.id;
  data['username'] = entity.username;
  data['veteranId'] = entity.veteranId;
  return data;
}

extension BindVeteranEntityExtension on BindVeteranEntity {
  BindVeteranEntity copyWith({
    String? avatar,
    String? familialName,
    String? id,
    String? username,
    int? veteranId,
  }) {
    return BindVeteranEntity()
      ..avatar = avatar ?? this.avatar
      ..familialName = familialName ?? this.familialName
      ..id = id ?? this.id
      ..username = username ?? this.username
      ..veteranId = veteranId ?? this.veteranId;
  }
}