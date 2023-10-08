import 'package:qqt_app/generated/json/base/json_field.dart';
import 'package:qqt_app/generated/json/food_entity.g.dart';
import 'dart:convert';
export 'package:qqt_app/generated/json/food_entity.g.dart';

@JsonSerializable()
class FoodEntity {
	int? errno = 0;
	String? errmsg = '';
	List<FoodData>? data;

	FoodEntity();

	factory FoodEntity.fromJson(Map<String, dynamic> json) => $FoodEntityFromJson(json);

	Map<String, dynamic> toJson() => $FoodEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FoodData {
	String? date = '';
	int? weekDay = 0;
	FoodDataBreakfast? breakfast;
	FoodDataLunch? lunch;
	FoodDataDinner? dinner;

	FoodData();

	factory FoodData.fromJson(Map<String, dynamic> json) => $FoodDataFromJson(json);

	Map<String, dynamic> toJson() => $FoodDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FoodDataBreakfast {
	String? time = '';
	List<FoodDataBreakfastFoods>? foods;
	bool? canBuy = false;

	FoodDataBreakfast();

	factory FoodDataBreakfast.fromJson(Map<String, dynamic> json) => $FoodDataBreakfastFromJson(json);

	Map<String, dynamic> toJson() => $FoodDataBreakfastToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FoodDataBreakfastFoods {
	int? foodId = 0;
	String? foodName = '';
	double? price;
	String? url = '';
	int? lx = 0;
	dynamic describe;

	FoodDataBreakfastFoods();

	factory FoodDataBreakfastFoods.fromJson(Map<String, dynamic> json) => $FoodDataBreakfastFoodsFromJson(json);

	Map<String, dynamic> toJson() => $FoodDataBreakfastFoodsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FoodDataLunch {
	String? time = '';
	List<FoodDataLunchFoods>? foods;
	bool? canBuy = false;

	FoodDataLunch();

	factory FoodDataLunch.fromJson(Map<String, dynamic> json) => $FoodDataLunchFromJson(json);

	Map<String, dynamic> toJson() => $FoodDataLunchToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FoodDataLunchFoods {
	int? foodId = 0;
	String? foodName = '';
	double? price;
	String? url = '';
	int? lx = 0;
	dynamic describe;

	FoodDataLunchFoods();

	factory FoodDataLunchFoods.fromJson(Map<String, dynamic> json) => $FoodDataLunchFoodsFromJson(json);

	Map<String, dynamic> toJson() => $FoodDataLunchFoodsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FoodDataDinner {
	String? time = '';
	List<FoodDataDinnerFoods>? foods;
	bool? canBuy = false;

	FoodDataDinner();

	factory FoodDataDinner.fromJson(Map<String, dynamic> json) => $FoodDataDinnerFromJson(json);

	Map<String, dynamic> toJson() => $FoodDataDinnerToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FoodDataDinnerFoods {
	int? foodId = 0;
	String? foodName = '';
	double? price;
	String? url = '';
	int? lx = 0;
	dynamic describe;

	FoodDataDinnerFoods();

	factory FoodDataDinnerFoods.fromJson(Map<String, dynamic> json) => $FoodDataDinnerFoodsFromJson(json);

	Map<String, dynamic> toJson() => $FoodDataDinnerFoodsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}