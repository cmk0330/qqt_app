import 'dart:async';

import 'package:flutter/animation.dart';

import 'exception.dart';

NetScope scopeNet(Function()? block) {
  return NetScope.value(block?.call());
}

class NetScope<T> {
  Future<T> _future;
  static Function? _catchFunc;
  static Function? _finallyFunc;

  NetScope(this._future);

  NetScope delayed(Duration duration, [T? result]) {
    return NetScope(Future.delayed(duration, () => result!));
  }

  // NetScope value(T value) {
  //   return NetScope(Future.value(value).onError((error, stackTrace) {
  //     _catchFunc = error as Function;
  //     return Future.error(error);
  //   }).whenComplete(() => _finallyFunc?.call()));
  // }
  //
  // NetScope error(Object error, [StackTrace? stackTrace]) {
  //   return NetScope(Future.error(error, stackTrace));
  // }

  factory NetScope.value(T value) {
    final future = Future.value(value).catchError((error, stackTrace) {
      _catchFunc = error as Function?;
    }).whenComplete(() => _finallyFunc?.call());
    return NetScope(future);
  }

  factory NetScope.delayed(Duration duration, [T? result]) {
    return NetScope(Future.delayed(duration, () => result!));
  }

  factory NetScope.error(Object error, [StackTrace? stackTrace]) {
    _catchFunc = error as Function?;
    return NetScope(Future.error(error, stackTrace));
  }

  NetScope onCatch(Function(ApiException)? block) {
    block?.call(_catchFunc?.call());
    return this;
  }

  NetScope onFinally(Function block) {
    _finallyFunc?.call();
    return this;
  }

  void cancel(Exception cause) {}

// @override
// Stream<T> asStream() {
//   return _future.asStream();
// }
//
// @override
// Future<R> then<R>(FutureOr<R> Function(T value) onValue, {Function? onError}) {
//   return _future.then((value) => onValue(value), onError: onError);
// }
//
// @override
// Future<T> timeout(Duration timeLimit, {FutureOr<T> Function()? onTimeout}) {
//   return _future.timeout(timeLimit, onTimeout: onTimeout);
// }
//
// @override
// Future<T> catchError(Function onError, {bool Function(Object error)? test}) {
//   _catch(onError.call());
//   print("错误啦啦啦--->$onError");
//   return _future.catchError(onError, test: test);
// }
//
// @override
// Future<T> whenComplete(FutureOr<void> Function() action) {
//   _finally();
//   return _future.whenComplete(action);
// }
}
