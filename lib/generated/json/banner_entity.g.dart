import 'package:qqt_app/generated/json/base/json_convert_content.dart';
import 'package:qqt_app/entity/banner_entity.dart';

BannerEntity $BannerEntityFromJson(Map<String, dynamic> json) {
  final BannerEntity bannerEntity = BannerEntity();
  final int? errno = jsonConvert.convert<int>(json['errno']);
  if (errno != null) {
    bannerEntity.errno = errno;
  }
  final String? errmsg = jsonConvert.convert<String>(json['errmsg']);
  if (errmsg != null) {
    bannerEntity.errmsg = errmsg;
  }
  final List<BannerData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BannerData>(e) as BannerData).toList();
  if (data != null) {
    bannerEntity.data = data;
  }
  return bannerEntity;
}

Map<String, dynamic> $BannerEntityToJson(BannerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['errno'] = entity.errno;
  data['errmsg'] = entity.errmsg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension BannerEntityExt on BannerEntity {
  BannerEntity copyWith({
    int? errno,
    String? errmsg,
    List<BannerData>? data,
  }) {
    return BannerEntity()
      ..errno = errno ?? this.errno
      ..errmsg = errmsg ?? this.errmsg
      ..data = data ?? this.data;
  }
}

BannerData $BannerDataFromJson(Map<String, dynamic> json) {
  final BannerData bannerData = BannerData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    bannerData.id = id;
  }
  final String? addTime = jsonConvert.convert<String>(json['addTime']);
  if (addTime != null) {
    bannerData.addTime = addTime;
  }
  final dynamic updateTime = json['updateTime'];
  if (updateTime != null) {
    bannerData.updateTime = updateTime;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    bannerData.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    bannerData.url = url;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    bannerData.sort = sort;
  }
  final String? linkUrl = jsonConvert.convert<String>(json['linkUrl']);
  if (linkUrl != null) {
    bannerData.linkUrl = linkUrl;
  }
  return bannerData;
}

Map<String, dynamic> $BannerDataToJson(BannerData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['addTime'] = entity.addTime;
  data['updateTime'] = entity.updateTime;
  data['type'] = entity.type;
  data['url'] = entity.url;
  data['sort'] = entity.sort;
  data['linkUrl'] = entity.linkUrl;
  return data;
}

extension BannerDataExt on BannerData {
  BannerData copyWith({
    String? id,
    String? addTime,
    dynamic updateTime,
    int? type,
    String? url,
    int? sort,
    String? linkUrl,
  }) {
    return BannerData()
      ..id = id ?? this.id
      ..addTime = addTime ?? this.addTime
      ..updateTime = updateTime ?? this.updateTime
      ..type = type ?? this.type
      ..url = url ?? this.url
      ..sort = sort ?? this.sort
      ..linkUrl = linkUrl ?? this.linkUrl;
  }
}