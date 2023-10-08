import 'package:qqt_app/generated/json/base/json_field.dart';
import 'package:qqt_app/generated/json/car_use_entity.g.dart';
import 'dart:convert';
export 'package:qqt_app/generated/json/car_use_entity.g.dart';

@JsonSerializable()
class CarUseEntity {
	int? errno = 0;
	CarUseData? data;
	String? errmsg = '';

	CarUseEntity();

	factory CarUseEntity.fromJson(Map<String, dynamic> json) => $CarUseEntityFromJson(json);

	Map<String, dynamic> toJson() => $CarUseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CarUseData {
	int? total = 0;
	int? pages = 0;
	int? limit = 0;
	int? page = 0;
	List<CarUseDataList>? list;

	CarUseData();

	factory CarUseData.fromJson(Map<String, dynamic> json) => $CarUseDataFromJson(json);

	Map<String, dynamic> toJson() => $CarUseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CarUseDataList {
	int? id = 0;
	int? merchId = 0;
	String? name = '';
	String? linkName = '';
	String? linkMobile = '';
	String? remark = '';
	String? addTime = '';
	String? updateTime = '';
	bool? deleted = false;
	dynamic courtyard;

	CarUseDataList();

	factory CarUseDataList.fromJson(Map<String, dynamic> json) => $CarUseDataListFromJson(json);

	Map<String, dynamic> toJson() => $CarUseDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}