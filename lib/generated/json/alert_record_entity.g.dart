import 'package:qqt_app/generated/json/base/json_convert_content.dart';
import 'package:qqt_app/entity/alert_record_entity.dart';

AlertRecordEntity $AlertRecordEntityFromJson(Map<String, dynamic> json) {
  final AlertRecordEntity alertRecordEntity = AlertRecordEntity();
  final String? addTime = jsonConvert.convert<String>(json['addTime']);
  if (addTime != null) {
    alertRecordEntity.addTime = addTime;
  }
  final String? messageName = jsonConvert.convert<String>(json['messageName']);
  if (messageName != null) {
    alertRecordEntity.messageName = messageName;
  }
  final int? messageType = jsonConvert.convert<int>(json['messageType']);
  if (messageType != null) {
    alertRecordEntity.messageType = messageType;
  }
  return alertRecordEntity;
}

Map<String, dynamic> $AlertRecordEntityToJson(AlertRecordEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addTime'] = entity.addTime;
  data['messageName'] = entity.messageName;
  data['messageType'] = entity.messageType;
  return data;
}

extension AlertRecordEntityExtension on AlertRecordEntity {
  AlertRecordEntity copyWith({
    String? addTime,
    String? messageName,
    int? messageType,
  }) {
    return AlertRecordEntity()
      ..addTime = addTime ?? this.addTime
      ..messageName = messageName ?? this.messageName
      ..messageType = messageType ?? this.messageType;
  }
}