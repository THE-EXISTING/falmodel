import 'package:equatable/equatable.dart';
import 'package:falmodel/lib.dart';
import 'package:flutter/foundation.dart';

enum BlocStatus { init, loading, success, fail }

@immutable
class BlocState<T> with EquatableMixin {
  const BlocState._(
      {this.data,
      required this.status,
      this.message,
      this.error,
      this.stacktrace});

  final BlocStatus status;
  final T? data;
  final String? message;
  final Object? error;
  final StackTrace? stacktrace;

  static BlocState<T> init<T>({T? data}) =>
      BlocState<T>._(data: data, status: BlocStatus.init);

  static BlocState<T> loading<T>({T? data}) =>
      BlocState<T>._(data: data, status: BlocStatus.loading);

  static BlocState<T> success<T>({T? data}) =>
      BlocState<T>._(data: data, status: BlocStatus.success);

  static BlocState<T> fail<T>(
          {T? data, Object? error, StackTrace? stackTrace}) =>
      BlocState<T>._(
          error: error,
          data: data,
          status: BlocStatus.fail,
          stacktrace: stackTrace);

  bool get isInit => status == BlocStatus.init;

  bool get isLoading => status == BlocStatus.loading;

  bool get isNotLoading => status != BlocStatus.loading;

  bool get isLoadingOrInit => isLoading || isInit;

  bool get isSuccess => status == BlocStatus.success;

  bool get isNotSuccess => status != BlocStatus.success;

  bool get isSuccessWithData => status == BlocStatus.success && data != null;

  bool get isFail => status == BlocStatus.fail;

  bool get isNotFail => status != BlocStatus.fail;

  bool get hasData => data != null;

  @override
  List<Object?> get props => [status, data, message, error, stacktrace];

  @override
  bool get stringify => true;

  BlocState<A> copy<A>(A? newData) {
    return BlocState._(
      data: newData,
      status: status,
      message: message,
      error: error,
      stacktrace: stacktrace,
    );
  }

  BlocState<S> mapData<S>(S? Function(T? data) convert) {
    final newData = convert(data);
    return BlocState._(
      data: newData,
      status: status,
      message: message,
      error: error,
      stacktrace: stacktrace,
    );
  }
}
