import 'package:qqt_app/generated/json/base/json_convert_content.dart';
import 'package:qqt_app/entity/login_entity.dart';

LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
  final LoginEntity loginEntity = LoginEntity();
  final int? errno = jsonConvert.convert<int>(json['errno']);
  if (errno != null) {
    loginEntity.errno = errno;
  }
  final String? errmsg = jsonConvert.convert<String>(json['errmsg']);
  if (errmsg != null) {
    loginEntity.errmsg = errmsg;
  }
  final LoginData? data = jsonConvert.convert<LoginData>(json['data']);
  if (data != null) {
    loginEntity.data = data;
  }
  return loginEntity;
}

Map<String, dynamic> $LoginEntityToJson(LoginEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['errno'] = entity.errno;
  data['errmsg'] = entity.errmsg;
  data['data'] = entity.data.toJson();
  return data;
}

extension LoginEntityExtension on LoginEntity {
  LoginEntity copyWith({
    int? errno,
    String? errmsg,
    LoginData? data,
  }) {
    return LoginEntity()
      ..errno = errno ?? this.errno
      ..errmsg = errmsg ?? this.errmsg
      ..data = data ?? this.data;
  }
}

LoginData $LoginDataFromJson(Map<String, dynamic> json) {
  final LoginData loginData = LoginData();
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    loginData.phone = phone;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    loginData.token = token;
  }
  final String? refreshToken = jsonConvert.convert<String>(
      json['refreshToken']);
  if (refreshToken != null) {
    loginData.refreshToken = refreshToken;
  }
  return loginData;
}

Map<String, dynamic> $LoginDataToJson(LoginData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['phone'] = entity.phone;
  data['token'] = entity.token;
  data['refreshToken'] = entity.refreshToken;
  return data;
}

extension LoginDataExtension on LoginData {
  LoginData copyWith({
    String? phone,
    String? token,
    String? refreshToken,
  }) {
    return LoginData()
      ..phone = phone ?? this.phone
      ..token = token ?? this.token
      ..refreshToken = refreshToken ?? this.refreshToken;
  }
}