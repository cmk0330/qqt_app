import 'package:qqt_app/generated/json/base/json_field.dart';
import 'package:qqt_app/generated/json/bind_veteran_entity.g.dart';
import 'dart:convert';
export 'package:qqt_app/generated/json/bind_veteran_entity.g.dart';

@JsonSerializable()
class BindVeteranEntity {
	late String avatar;
	late String familialName;
	late String id;
	late String username;
	late int veteranId;

	BindVeteranEntity();

	factory BindVeteranEntity.fromJson(Map<String, dynamic> json) => $BindVeteranEntityFromJson(json);

	Map<String, dynamic> toJson() => $BindVeteranEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}