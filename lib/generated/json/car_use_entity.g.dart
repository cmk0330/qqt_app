import 'package:qqt_app/generated/json/base/json_convert_content.dart';
import 'package:qqt_app/entity/car_use_entity.dart';

CarUseEntity $CarUseEntityFromJson(Map<String, dynamic> json) {
  final CarUseEntity carUseEntity = CarUseEntity();
  final int? errno = jsonConvert.convert<int>(json['errno']);
  if (errno != null) {
    carUseEntity.errno = errno;
  }
  final CarUseData? data = jsonConvert.convert<CarUseData>(json['data']);
  if (data != null) {
    carUseEntity.data = data;
  }
  final String? errmsg = jsonConvert.convert<String>(json['errmsg']);
  if (errmsg != null) {
    carUseEntity.errmsg = errmsg;
  }
  return carUseEntity;
}

Map<String, dynamic> $CarUseEntityToJson(CarUseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['errno'] = entity.errno;
  data['data'] = entity.data?.toJson();
  data['errmsg'] = entity.errmsg;
  return data;
}

extension CarUseEntityExt on CarUseEntity {
  CarUseEntity copyWith({
    int? errno,
    CarUseData? data,
    String? errmsg,
  }) {
    return CarUseEntity()
      ..errno = errno ?? this.errno
      ..data = data ?? this.data
      ..errmsg = errmsg ?? this.errmsg;
  }
}

CarUseData $CarUseDataFromJson(Map<String, dynamic> json) {
  final CarUseData carUseData = CarUseData();
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    carUseData.total = total;
  }
  final int? pages = jsonConvert.convert<int>(json['pages']);
  if (pages != null) {
    carUseData.pages = pages;
  }
  final int? limit = jsonConvert.convert<int>(json['limit']);
  if (limit != null) {
    carUseData.limit = limit;
  }
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    carUseData.page = page;
  }
  final List<CarUseDataList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CarUseDataList>(e) as CarUseDataList)
      .toList();
  if (list != null) {
    carUseData.list = list;
  }
  return carUseData;
}

Map<String, dynamic> $CarUseDataToJson(CarUseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['total'] = entity.total;
  data['pages'] = entity.pages;
  data['limit'] = entity.limit;
  data['page'] = entity.page;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension CarUseDataExt on CarUseData {
  CarUseData copyWith({
    int? total,
    int? pages,
    int? limit,
    int? page,
    List<CarUseDataList>? list,
  }) {
    return CarUseData()
      ..total = total ?? this.total
      ..pages = pages ?? this.pages
      ..limit = limit ?? this.limit
      ..page = page ?? this.page
      ..list = list ?? this.list;
  }
}

CarUseDataList $CarUseDataListFromJson(Map<String, dynamic> json) {
  final CarUseDataList carUseDataList = CarUseDataList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    carUseDataList.id = id;
  }
  final int? merchId = jsonConvert.convert<int>(json['merchId']);
  if (merchId != null) {
    carUseDataList.merchId = merchId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    carUseDataList.name = name;
  }
  final String? linkName = jsonConvert.convert<String>(json['linkName']);
  if (linkName != null) {
    carUseDataList.linkName = linkName;
  }
  final String? linkMobile = jsonConvert.convert<String>(json['linkMobile']);
  if (linkMobile != null) {
    carUseDataList.linkMobile = linkMobile;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    carUseDataList.remark = remark;
  }
  final String? addTime = jsonConvert.convert<String>(json['addTime']);
  if (addTime != null) {
    carUseDataList.addTime = addTime;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    carUseDataList.updateTime = updateTime;
  }
  final bool? deleted = jsonConvert.convert<bool>(json['deleted']);
  if (deleted != null) {
    carUseDataList.deleted = deleted;
  }
  final dynamic courtyard = json['courtyard'];
  if (courtyard != null) {
    carUseDataList.courtyard = courtyard;
  }
  return carUseDataList;
}

Map<String, dynamic> $CarUseDataListToJson(CarUseDataList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['merchId'] = entity.merchId;
  data['name'] = entity.name;
  data['linkName'] = entity.linkName;
  data['linkMobile'] = entity.linkMobile;
  data['remark'] = entity.remark;
  data['addTime'] = entity.addTime;
  data['updateTime'] = entity.updateTime;
  data['deleted'] = entity.deleted;
  data['courtyard'] = entity.courtyard;
  return data;
}

extension CarUseDataListExt on CarUseDataList {
  CarUseDataList copyWith({
    int? id,
    int? merchId,
    String? name,
    String? linkName,
    String? linkMobile,
    String? remark,
    String? addTime,
    String? updateTime,
    bool? deleted,
    dynamic courtyard,
  }) {
    return CarUseDataList()
      ..id = id ?? this.id
      ..merchId = merchId ?? this.merchId
      ..name = name ?? this.name
      ..linkName = linkName ?? this.linkName
      ..linkMobile = linkMobile ?? this.linkMobile
      ..remark = remark ?? this.remark
      ..addTime = addTime ?? this.addTime
      ..updateTime = updateTime ?? this.updateTime
      ..deleted = deleted ?? this.deleted
      ..courtyard = courtyard ?? this.courtyard;
  }
}