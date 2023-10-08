import 'package:qqt_app/generated/json/base/json_field.dart';
import 'package:qqt_app/generated/json/banner_entity.g.dart';
import 'dart:convert';
export 'package:qqt_app/generated/json/banner_entity.g.dart';

@JsonSerializable()
class BannerEntity {
	int? errno = 0;
	String? errmsg = '';
	List<BannerData>? data;

	BannerEntity();

	factory BannerEntity.fromJson(Map<String, dynamic> json) => $BannerEntityFromJson(json);

	Map<String, dynamic> toJson() => $BannerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BannerData {
	String? id = '';
	String? addTime = '';
	dynamic updateTime;
	int? type = 0;
	String? url = '';
	int? sort = 0;
	String? linkUrl = '';

	BannerData();

	factory BannerData.fromJson(Map<String, dynamic> json) => $BannerDataFromJson(json);

	Map<String, dynamic> toJson() => $BannerDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}