import 'package:dio/dio.dart';

import 'api_response/api_response_entity.dart';

class ApiException implements Exception {
  static const unknownException = "未知错误";
  final String? message;
  final int? code;
  dynamic stackInfo;

  ApiException([this.code, this.message, this.stackInfo]);

  factory ApiException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return RequestException(-1, "请求取消");
      case DioErrorType.connectTimeout:
        return RequestException(-1, "连接超时");
      case DioErrorType.sendTimeout:
        return RequestException(-1, "请求超时");
      case DioErrorType.receiveTimeout:
        return RequestException(-1, "响应超时");
      case DioErrorType.response:
        try {
          int? errCode = error.response?.statusCode;
          switch (errCode) {
            case 400:
              return ResponseException(errCode!, "请求语法错误");
            case 401:
              return ResponseException(errCode!, "没有权限");
            case 403:
              return ResponseException(errCode!, "服务器拒绝执行");
            case 404:
              return ResponseException(errCode!, "无法连接服务器");
            case 405:
              return ResponseException(errCode!, "请求方法被禁止");
            case 500:
              return ResponseException(errCode!, "服务器内部错误");
            case 502:
              return ResponseException(errCode!, "无效的请求");
            case 503:
              return ResponseException(errCode!, "服务器异常");
            case 505:
              return ResponseException(errCode!, "不支持HTTP协议请求");
            default:
              // http错误码带业务错误信息
              ApiResponse apiResponse =
                  ApiResponse.fromJson(error.response?.data);
              if (apiResponse.code != null) {
                return ApiException(
                    apiResponse.code, apiResponse.message, error.message);
              } else {
                return ApiException(
                    errCode, error.response?.statusMessage ?? error.message);
              }
          }
        } on Exception catch (e) {
          return ApiException(-1, e.toString());
        }
      default:
        return ApiException(-1, error.message);
    }
  }

  factory ApiException.from(dynamic exception) {
    if (exception is DioError) {
      return ApiException.fromDioError(exception);
    }
    if (exception is ApiException) {
      return exception;
    } else {
      var apiException = ApiException(-1, exception.toString());
      return apiException;
    }
  }
}

/// 请求错误
class RequestException extends ApiException {
  RequestException([int? code, String? message]) : super(code, message);
}

/// Http请求在服务器响应成功后失败
class ResponseException extends ApiException {
  ResponseException(
      [int code = -1, String message = '', StackTrace? stackTrace])
      : super(code, message);
}
