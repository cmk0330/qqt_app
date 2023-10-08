import 'package:qqt_app/generated/json/base/json_field.dart';
import 'package:qqt_app/generated/json/refresh_token_entity.g.dart';
import 'dart:convert';
export 'package:qqt_app/generated/json/refresh_token_entity.g.dart';

@JsonSerializable()
class RefreshTokenEntity {
	 String? refreshToken;
	 String? token;

	RefreshTokenEntity();

	factory RefreshTokenEntity.fromJson(Map<String, dynamic> json) => $RefreshTokenEntityFromJson(json);

	Map<String, dynamic> toJson() => $RefreshTokenEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}