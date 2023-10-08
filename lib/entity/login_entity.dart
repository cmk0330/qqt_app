import 'package:qqt_app/generated/json/base/json_field.dart';
import 'package:qqt_app/generated/json/login_entity.g.dart';
import 'dart:convert';
export 'package:qqt_app/generated/json/login_entity.g.dart';

@JsonSerializable()
class LoginEntity {
	late int errno;
	late String errmsg;
	late LoginData data;

	LoginEntity();

	factory LoginEntity.fromJson(Map<String, dynamic> json) => $LoginEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class LoginData {
	 String? phone;
	 String? token;
	 String? refreshToken;

	LoginData();

	factory LoginData.fromJson(Map<String, dynamic> json) => $LoginDataFromJson(json);

	Map<String, dynamic> toJson() => $LoginDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}