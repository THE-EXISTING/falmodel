import 'package:equatable/equatable.dart';
import 'package:falmodel/falmodel.dart';
import 'package:flutter/foundation.dart';

enum BlocStatus { init, loading, success, error }

@immutable
class BlocState<T> with EquatableMixin {
  const BlocState._(
      {this.data,
      required this.status,
      this.message,
      this.error,
      this.stackTrace});

  final BlocStatus status;
  final T? data;
  final String? message;
  final Object? error;
  final StackTrace? stackTrace;

  static BlocState<T> init<T>({T? data}) =>
      BlocState<T>._(data: data, status: BlocStatus.init);

  static BlocState<T> loading<T>({T? data}) =>
      BlocState<T>._(data: data, status: BlocStatus.loading);

  static BlocState<T> success<T>({T? data}) =>
      BlocState<T>._(data: data, status: BlocStatus.success);

  static BlocState<T> exception<T>(
          {T? data, Object? error, StackTrace? stackTrace}) =>
      BlocState<T>._(
          error: error,
          data: data,
          status: BlocStatus.error,
          stackTrace: stackTrace);

  bool isInit() => status == BlocStatus.init;

  bool isLoading() => status == BlocStatus.loading;

  bool isNotLoading() => status != BlocStatus.loading;

  bool isLoadingOrInit() => isLoading() || isInit();

  bool isSuccess() => status == BlocStatus.success;

  bool isNotSuccess() => status != BlocStatus.success;

  bool isSuccessWithData() => status == BlocStatus.success && data != null;

  bool isError() => status == BlocStatus.error;

  bool isNotException() => status != BlocStatus.error;

  bool hasData() => data != null;

  @override
  List<Object?> get props => [status, data, message, error, stackTrace];

  @override
  bool get stringify => true;

  BlocState<A> copyData<A>(A? newData) {
    return BlocState._(
      data: newData,
      status: status,
      message: message,
      error: error,
      stackTrace: stackTrace,
    );
  }

  BlocState<S> mapData<S>(S? Function(T? data) convert) {
    final newData = convert(data);
    return BlocState._(
      data: newData,
      status: status,
      message: message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
