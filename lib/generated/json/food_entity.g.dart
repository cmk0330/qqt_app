import 'package:qqt_app/generated/json/base/json_convert_content.dart';
import 'package:qqt_app/entity/food_entity.dart';

FoodEntity $FoodEntityFromJson(Map<String, dynamic> json) {
  final FoodEntity foodEntity = FoodEntity();
  final int? errno = jsonConvert.convert<int>(json['errno']);
  if (errno != null) {
    foodEntity.errno = errno;
  }
  final String? errmsg = jsonConvert.convert<String>(json['errmsg']);
  if (errmsg != null) {
    foodEntity.errmsg = errmsg;
  }
  final List<FoodData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<FoodData>(e) as FoodData).toList();
  if (data != null) {
    foodEntity.data = data;
  }
  return foodEntity;
}

Map<String, dynamic> $FoodEntityToJson(FoodEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['errno'] = entity.errno;
  data['errmsg'] = entity.errmsg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension FoodEntityExtension on FoodEntity {
  FoodEntity copyWith({
    int? errno,
    String? errmsg,
    List<FoodData>? data,
  }) {
    return FoodEntity()
      ..errno = errno ?? this.errno
      ..errmsg = errmsg ?? this.errmsg
      ..data = data ?? this.data;
  }
}

FoodData $FoodDataFromJson(Map<String, dynamic> json) {
  final FoodData foodData = FoodData();
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    foodData.date = date;
  }
  final int? weekDay = jsonConvert.convert<int>(json['weekDay']);
  if (weekDay != null) {
    foodData.weekDay = weekDay;
  }
  final FoodDataBreakfast? breakfast = jsonConvert.convert<FoodDataBreakfast>(
      json['breakfast']);
  if (breakfast != null) {
    foodData.breakfast = breakfast;
  }
  final FoodDataLunch? lunch = jsonConvert.convert<FoodDataLunch>(
      json['lunch']);
  if (lunch != null) {
    foodData.lunch = lunch;
  }
  final FoodDataDinner? dinner = jsonConvert.convert<FoodDataDinner>(
      json['dinner']);
  if (dinner != null) {
    foodData.dinner = dinner;
  }
  return foodData;
}

Map<String, dynamic> $FoodDataToJson(FoodData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['date'] = entity.date;
  data['weekDay'] = entity.weekDay;
  data['breakfast'] = entity.breakfast?.toJson();
  data['lunch'] = entity.lunch?.toJson();
  data['dinner'] = entity.dinner?.toJson();
  return data;
}

extension FoodDataExtension on FoodData {
  FoodData copyWith({
    String? date,
    int? weekDay,
    FoodDataBreakfast? breakfast,
    FoodDataLunch? lunch,
    FoodDataDinner? dinner,
  }) {
    return FoodData()
      ..date = date ?? this.date
      ..weekDay = weekDay ?? this.weekDay
      ..breakfast = breakfast ?? this.breakfast
      ..lunch = lunch ?? this.lunch
      ..dinner = dinner ?? this.dinner;
  }
}

FoodDataBreakfast $FoodDataBreakfastFromJson(Map<String, dynamic> json) {
  final FoodDataBreakfast foodDataBreakfast = FoodDataBreakfast();
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    foodDataBreakfast.time = time;
  }
  final List<FoodDataBreakfastFoods>? foods = (json['foods'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<FoodDataBreakfastFoods>(e) as FoodDataBreakfastFoods)
      .toList();
  if (foods != null) {
    foodDataBreakfast.foods = foods;
  }
  final bool? canBuy = jsonConvert.convert<bool>(json['canBuy']);
  if (canBuy != null) {
    foodDataBreakfast.canBuy = canBuy;
  }
  return foodDataBreakfast;
}

Map<String, dynamic> $FoodDataBreakfastToJson(FoodDataBreakfast entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['time'] = entity.time;
  data['foods'] = entity.foods?.map((v) => v.toJson()).toList();
  data['canBuy'] = entity.canBuy;
  return data;
}

extension FoodDataBreakfastExtension on FoodDataBreakfast {
  FoodDataBreakfast copyWith({
    String? time,
    List<FoodDataBreakfastFoods>? foods,
    bool? canBuy,
  }) {
    return FoodDataBreakfast()
      ..time = time ?? this.time
      ..foods = foods ?? this.foods
      ..canBuy = canBuy ?? this.canBuy;
  }
}

FoodDataBreakfastFoods $FoodDataBreakfastFoodsFromJson(
    Map<String, dynamic> json) {
  final FoodDataBreakfastFoods foodDataBreakfastFoods = FoodDataBreakfastFoods();
  final int? foodId = jsonConvert.convert<int>(json['foodId']);
  if (foodId != null) {
    foodDataBreakfastFoods.foodId = foodId;
  }
  final String? foodName = jsonConvert.convert<String>(json['foodName']);
  if (foodName != null) {
    foodDataBreakfastFoods.foodName = foodName;
  }
  final double? price = jsonConvert.convert<double>(json['price']);
  if (price != null) {
    foodDataBreakfastFoods.price = price;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    foodDataBreakfastFoods.url = url;
  }
  final int? lx = jsonConvert.convert<int>(json['lx']);
  if (lx != null) {
    foodDataBreakfastFoods.lx = lx;
  }
  final dynamic describe = json['describe'];
  if (describe != null) {
    foodDataBreakfastFoods.describe = describe;
  }
  return foodDataBreakfastFoods;
}

Map<String, dynamic> $FoodDataBreakfastFoodsToJson(
    FoodDataBreakfastFoods entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['foodId'] = entity.foodId;
  data['foodName'] = entity.foodName;
  data['price'] = entity.price;
  data['url'] = entity.url;
  data['lx'] = entity.lx;
  data['describe'] = entity.describe;
  return data;
}

extension FoodDataBreakfastFoodsExtension on FoodDataBreakfastFoods {
  FoodDataBreakfastFoods copyWith({
    int? foodId,
    String? foodName,
    double? price,
    String? url,
    int? lx,
    dynamic describe,
  }) {
    return FoodDataBreakfastFoods()
      ..foodId = foodId ?? this.foodId
      ..foodName = foodName ?? this.foodName
      ..price = price ?? this.price
      ..url = url ?? this.url
      ..lx = lx ?? this.lx
      ..describe = describe ?? this.describe;
  }
}

FoodDataLunch $FoodDataLunchFromJson(Map<String, dynamic> json) {
  final FoodDataLunch foodDataLunch = FoodDataLunch();
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    foodDataLunch.time = time;
  }
  final List<FoodDataLunchFoods>? foods = (json['foods'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<FoodDataLunchFoods>(e) as FoodDataLunchFoods)
      .toList();
  if (foods != null) {
    foodDataLunch.foods = foods;
  }
  final bool? canBuy = jsonConvert.convert<bool>(json['canBuy']);
  if (canBuy != null) {
    foodDataLunch.canBuy = canBuy;
  }
  return foodDataLunch;
}

Map<String, dynamic> $FoodDataLunchToJson(FoodDataLunch entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['time'] = entity.time;
  data['foods'] = entity.foods?.map((v) => v.toJson()).toList();
  data['canBuy'] = entity.canBuy;
  return data;
}

extension FoodDataLunchExtension on FoodDataLunch {
  FoodDataLunch copyWith({
    String? time,
    List<FoodDataLunchFoods>? foods,
    bool? canBuy,
  }) {
    return FoodDataLunch()
      ..time = time ?? this.time
      ..foods = foods ?? this.foods
      ..canBuy = canBuy ?? this.canBuy;
  }
}

FoodDataLunchFoods $FoodDataLunchFoodsFromJson(Map<String, dynamic> json) {
  final FoodDataLunchFoods foodDataLunchFoods = FoodDataLunchFoods();
  final int? foodId = jsonConvert.convert<int>(json['foodId']);
  if (foodId != null) {
    foodDataLunchFoods.foodId = foodId;
  }
  final String? foodName = jsonConvert.convert<String>(json['foodName']);
  if (foodName != null) {
    foodDataLunchFoods.foodName = foodName;
  }
  final double? price = jsonConvert.convert<double>(json['price']);
  if (price != null) {
    foodDataLunchFoods.price = price;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    foodDataLunchFoods.url = url;
  }
  final int? lx = jsonConvert.convert<int>(json['lx']);
  if (lx != null) {
    foodDataLunchFoods.lx = lx;
  }
  final dynamic describe = json['describe'];
  if (describe != null) {
    foodDataLunchFoods.describe = describe;
  }
  return foodDataLunchFoods;
}

Map<String, dynamic> $FoodDataLunchFoodsToJson(FoodDataLunchFoods entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['foodId'] = entity.foodId;
  data['foodName'] = entity.foodName;
  data['price'] = entity.price;
  data['url'] = entity.url;
  data['lx'] = entity.lx;
  data['describe'] = entity.describe;
  return data;
}

extension FoodDataLunchFoodsExtension on FoodDataLunchFoods {
  FoodDataLunchFoods copyWith({
    int? foodId,
    String? foodName,
    double? price,
    String? url,
    int? lx,
    dynamic describe,
  }) {
    return FoodDataLunchFoods()
      ..foodId = foodId ?? this.foodId
      ..foodName = foodName ?? this.foodName
      ..price = price ?? this.price
      ..url = url ?? this.url
      ..lx = lx ?? this.lx
      ..describe = describe ?? this.describe;
  }
}

FoodDataDinner $FoodDataDinnerFromJson(Map<String, dynamic> json) {
  final FoodDataDinner foodDataDinner = FoodDataDinner();
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    foodDataDinner.time = time;
  }
  final List<FoodDataDinnerFoods>? foods = (json['foods'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<FoodDataDinnerFoods>(e) as FoodDataDinnerFoods)
      .toList();
  if (foods != null) {
    foodDataDinner.foods = foods;
  }
  final bool? canBuy = jsonConvert.convert<bool>(json['canBuy']);
  if (canBuy != null) {
    foodDataDinner.canBuy = canBuy;
  }
  return foodDataDinner;
}

Map<String, dynamic> $FoodDataDinnerToJson(FoodDataDinner entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['time'] = entity.time;
  data['foods'] = entity.foods?.map((v) => v.toJson()).toList();
  data['canBuy'] = entity.canBuy;
  return data;
}

extension FoodDataDinnerExtension on FoodDataDinner {
  FoodDataDinner copyWith({
    String? time,
    List<FoodDataDinnerFoods>? foods,
    bool? canBuy,
  }) {
    return FoodDataDinner()
      ..time = time ?? this.time
      ..foods = foods ?? this.foods
      ..canBuy = canBuy ?? this.canBuy;
  }
}

FoodDataDinnerFoods $FoodDataDinnerFoodsFromJson(Map<String, dynamic> json) {
  final FoodDataDinnerFoods foodDataDinnerFoods = FoodDataDinnerFoods();
  final int? foodId = jsonConvert.convert<int>(json['foodId']);
  if (foodId != null) {
    foodDataDinnerFoods.foodId = foodId;
  }
  final String? foodName = jsonConvert.convert<String>(json['foodName']);
  if (foodName != null) {
    foodDataDinnerFoods.foodName = foodName;
  }
  final double? price = jsonConvert.convert<double>(json['price']);
  if (price != null) {
    foodDataDinnerFoods.price = price;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    foodDataDinnerFoods.url = url;
  }
  final int? lx = jsonConvert.convert<int>(json['lx']);
  if (lx != null) {
    foodDataDinnerFoods.lx = lx;
  }
  final dynamic describe = json['describe'];
  if (describe != null) {
    foodDataDinnerFoods.describe = describe;
  }
  return foodDataDinnerFoods;
}

Map<String, dynamic> $FoodDataDinnerFoodsToJson(FoodDataDinnerFoods entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['foodId'] = entity.foodId;
  data['foodName'] = entity.foodName;
  data['price'] = entity.price;
  data['url'] = entity.url;
  data['lx'] = entity.lx;
  data['describe'] = entity.describe;
  return data;
}

extension FoodDataDinnerFoodsExtension on FoodDataDinnerFoods {
  FoodDataDinnerFoods copyWith({
    int? foodId,
    String? foodName,
    double? price,
    String? url,
    int? lx,
    dynamic describe,
  }) {
    return FoodDataDinnerFoods()
      ..foodId = foodId ?? this.foodId
      ..foodName = foodName ?? this.foodName
      ..price = price ?? this.price
      ..url = url ?? this.url
      ..lx = lx ?? this.lx
      ..describe = describe ?? this.describe;
  }
}