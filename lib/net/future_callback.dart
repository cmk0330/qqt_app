import 'package:qqt_app/net/Api.dart';

import 'api_response/api_response_entity.dart';

class FutureCallback {
  void onError(ApiResponse err) {}

  void onComplete() {}
}

class FutureAction extends FutureCallback {
  Function(ApiResponse)? _onError;
  Function()? _onComplete;

  void error(Function(ApiResponse) func) {
    _onError = func;
  }

  void complete(Function() func) {
    _onComplete = func;
  }

  @override
  void onError(ApiResponse err) {
    _onError?.call(err);
  }

  @override
  void onComplete() {
    _onComplete?.call();
  }
}
