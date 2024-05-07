import 'package:qqt_app/generated/json/base/json_field.dart';
import 'dart:convert';

import 'package:qqt_app/generated/json/wan_android_entity.g.dart';

@JsonSerializable()
class WanAndroidEntity {
	late WanAndroidData data;
	late int errorCode;
	late String errorMsg;

	WanAndroidEntity();

	factory WanAndroidEntity.fromJson(Map<String, dynamic> json) => $WanAndroidEntityFromJson(json);

	Map<String, dynamic> toJson() => $WanAndroidEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WanAndroidData {
	late int curPage;
	late List<WanAndroidDataDatas> datas;
	late int offset;
	late bool over;
	late int pageCount;
	late int size;
	late int total;

	WanAndroidData();

	factory WanAndroidData.fromJson(Map<String, dynamic> json) => $WanAndroidDataFromJson(json);

	Map<String, dynamic> toJson() => $WanAndroidDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WanAndroidDataDatas {
	late bool adminAdd;
	late String apkLink;
	late int audit;
	late String author;
	late bool canEdit;
	late int chapterId;
	late String chapterName;
	late bool collect;
	late int courseId;
	late String desc;
	late String descMd;
	late String envelopePic;
	late bool fresh;
	late String host;
	late int id;
	late bool isAdminAdd;
	late String link;
	late String niceDate;
	late String niceShareDate;
	late String origin;
	late String prefix;
	late String projectLink;
	late int publishTime;
	late int realSuperChapterId;
	late int selfVisible;
	late int shareDate;
	late String shareUser;
	late int superChapterId;
	late String superChapterName;
	late List<WanAndroidDataDatasTags> tags;
	late String title;
	late int type;
	late int userId;
	late int visible;
	late int zan;

	WanAndroidDataDatas();

	factory WanAndroidDataDatas.fromJson(Map<String, dynamic> json) => $WanAndroidDataDatasFromJson(json);

	Map<String, dynamic> toJson() => $WanAndroidDataDatasToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class WanAndroidDataDatasTags {
	late String name;
	late String url;

	WanAndroidDataDatasTags();

	factory WanAndroidDataDatasTags.fromJson(Map<String, dynamic> json) => $WanAndroidDataDatasTagsFromJson(json);

	Map<String, dynamic> toJson() => $WanAndroidDataDatasTagsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}