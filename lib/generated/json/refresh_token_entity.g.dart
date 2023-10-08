import 'package:qqt_app/generated/json/base/json_convert_content.dart';
import 'package:qqt_app/entity/refresh_token_entity.dart';

RefreshTokenEntity $RefreshTokenEntityFromJson(Map<String, dynamic> json) {
  final RefreshTokenEntity refreshTokenEntity = RefreshTokenEntity();
  final String? refreshToken = jsonConvert.convert<String>(
      json['refreshToken']);
  if (refreshToken != null) {
    refreshTokenEntity.refreshToken = refreshToken;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    refreshTokenEntity.token = token;
  }
  return refreshTokenEntity;
}

Map<String, dynamic> $RefreshTokenEntityToJson(RefreshTokenEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['refreshToken'] = entity.refreshToken;
  data['token'] = entity.token;
  return data;
}

extension RefreshTokenEntityExt on RefreshTokenEntity {
  RefreshTokenEntity copyWith({
    String? refreshToken,
    String? token,
  }) {
    return RefreshTokenEntity()
      ..refreshToken = refreshToken ?? this.refreshToken
      ..token = token ?? this.token;
  }
}