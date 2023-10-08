// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:qqt_app/entity/alert_record_entity.dart';
import 'package:qqt_app/entity/banner_entity.dart';
import 'package:qqt_app/entity/car_use_entity.dart';
import 'package:qqt_app/entity/food_entity.dart';
import 'package:qqt_app/entity/login_entity.dart';
import 'package:qqt_app/entity/refresh_token_entity.dart';
import 'package:qqt_app/model/bind_veteran_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);

class JsonConvert {
  static final Map<String, JsonConvertFunction> convertFuncMap = {
    (AlertRecordEntity).toString(): AlertRecordEntity.fromJson,
    (BannerEntity).toString(): BannerEntity.fromJson,
    (BannerData).toString(): BannerData.fromJson,
    (CarUseEntity).toString(): CarUseEntity.fromJson,
    (CarUseData).toString(): CarUseData.fromJson,
    (CarUseDataList).toString(): CarUseDataList.fromJson,
    (FoodEntity).toString(): FoodEntity.fromJson,
    (FoodData).toString(): FoodData.fromJson,
    (FoodDataBreakfast).toString(): FoodDataBreakfast.fromJson,
    (FoodDataBreakfastFoods).toString(): FoodDataBreakfastFoods.fromJson,
    (FoodDataLunch).toString(): FoodDataLunch.fromJson,
    (FoodDataLunchFoods).toString(): FoodDataLunchFoods.fromJson,
    (FoodDataDinner).toString(): FoodDataDinner.fromJson,
    (FoodDataDinnerFoods).toString(): FoodDataDinnerFoods.fromJson,
    (LoginEntity).toString(): LoginEntity.fromJson,
    (LoginData).toString(): LoginData.fromJson,
    (RefreshTokenEntity).toString(): RefreshTokenEntity.fromJson,
    (BindVeteranEntity).toString(): BindVeteranEntity.fromJson,
  };

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else if (type == "List" || type.startsWith("List<")) {
      return fromJsonAsT(value);
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError('$type unimplemented');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<AlertRecordEntity>[] is M) {
      return data.map<AlertRecordEntity>((Map<String, dynamic> e) =>
          AlertRecordEntity.fromJson(e)).toList() as M;
    }
    if (<BannerEntity>[] is M) {
      return data.map<BannerEntity>((Map<String, dynamic> e) =>
          BannerEntity.fromJson(e)).toList() as M;
    }
    if (<BannerData>[] is M) {
      return data.map<BannerData>((Map<String, dynamic> e) =>
          BannerData.fromJson(e)).toList() as M;
    }
    if (<CarUseEntity>[] is M) {
      return data.map<CarUseEntity>((Map<String, dynamic> e) =>
          CarUseEntity.fromJson(e)).toList() as M;
    }
    if (<CarUseData>[] is M) {
      return data.map<CarUseData>((Map<String, dynamic> e) =>
          CarUseData.fromJson(e)).toList() as M;
    }
    if (<CarUseDataList>[] is M) {
      return data.map<CarUseDataList>((Map<String, dynamic> e) =>
          CarUseDataList.fromJson(e)).toList() as M;
    }
    if (<FoodEntity>[] is M) {
      return data.map<FoodEntity>((Map<String, dynamic> e) =>
          FoodEntity.fromJson(e)).toList() as M;
    }
    if (<FoodData>[] is M) {
      return data.map<FoodData>((Map<String, dynamic> e) =>
          FoodData.fromJson(e)).toList() as M;
    }
    if (<FoodDataBreakfast>[] is M) {
      return data.map<FoodDataBreakfast>((Map<String, dynamic> e) =>
          FoodDataBreakfast.fromJson(e)).toList() as M;
    }
    if (<FoodDataBreakfastFoods>[] is M) {
      return data.map<FoodDataBreakfastFoods>((Map<String, dynamic> e) =>
          FoodDataBreakfastFoods.fromJson(e)).toList() as M;
    }
    if (<FoodDataLunch>[] is M) {
      return data.map<FoodDataLunch>((Map<String, dynamic> e) =>
          FoodDataLunch.fromJson(e)).toList() as M;
    }
    if (<FoodDataLunchFoods>[] is M) {
      return data.map<FoodDataLunchFoods>((Map<String, dynamic> e) =>
          FoodDataLunchFoods.fromJson(e)).toList() as M;
    }
    if (<FoodDataDinner>[] is M) {
      return data.map<FoodDataDinner>((Map<String, dynamic> e) =>
          FoodDataDinner.fromJson(e)).toList() as M;
    }
    if (<FoodDataDinnerFoods>[] is M) {
      return data.map<FoodDataDinnerFoods>((Map<String, dynamic> e) =>
          FoodDataDinnerFoods.fromJson(e)).toList() as M;
    }
    if (<LoginEntity>[] is M) {
      return data.map<LoginEntity>((Map<String, dynamic> e) =>
          LoginEntity.fromJson(e)).toList() as M;
    }
    if (<LoginData>[] is M) {
      return data.map<LoginData>((Map<String, dynamic> e) =>
          LoginData.fromJson(e)).toList() as M;
    }
    if (<RefreshTokenEntity>[] is M) {
      return data.map<RefreshTokenEntity>((Map<String, dynamic> e) =>
          RefreshTokenEntity.fromJson(e)).toList() as M;
    }
    if (<BindVeteranEntity>[] is M) {
      return data.map<BindVeteranEntity>((Map<String, dynamic> e) =>
          BindVeteranEntity.fromJson(e)).toList() as M;
    }

    debugPrint("${M.toString()} not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}