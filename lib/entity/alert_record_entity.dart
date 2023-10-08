import 'package:qqt_app/generated/json/base/json_field.dart';
import 'package:qqt_app/generated/json/alert_record_entity.g.dart';
import 'dart:convert';
export 'package:qqt_app/generated/json/alert_record_entity.g.dart';

@JsonSerializable()
class AlertRecordEntity {
	late String addTime;
	late String messageName;
	late int messageType;

	AlertRecordEntity();

	factory AlertRecordEntity.fromJson(Map<String, dynamic> json) => $AlertRecordEntityFromJson(json);

	Map<String, dynamic> toJson() => $AlertRecordEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}