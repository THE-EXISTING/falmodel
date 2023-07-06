// Created by Nonthawit on 4/7/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

abstract class WidgetState {}

class WidgetEvent<EVENT> extends WidgetState {
  final EVENT name;
  final Object? data;

  WidgetEvent(
    this.name, {
    this.data,
  });

  @override
  String toString() {
    return 'WidgetEvent{name: $name, data: $data}';
  }
}

class WidgetDataState<DATA> extends WidgetState {
  WidgetDataState(this.status, this.data);

  final WidgetStatus status;
  final DATA? data;

  bool get isInitial => status == WidgetStatus.initial;

  bool get isNotInitial => !isInitial;

  bool get isNormal => status == WidgetStatus.normal;

  bool get isNotNormal => !isNormal;

  bool get isDisabled => status == WidgetStatus.disabled;

  bool get isNotDisabled => !isDisabled;

  bool get isLoading => status == WidgetStatus.loading;

  bool get isNotLoading => !isLoading;

  bool get isEmpty => status == WidgetStatus.empty;

  bool get isNotEmpty => !isEmpty;

  bool get isFail => status == WidgetStatus.fail;

  bool get isNotFail => !isFail;

  bool get isSuccess => status == WidgetStatus.success;

  bool get isNotSuccess => !isSuccess;

  R apply<R>(Function2<WidgetStatus, DATA?, R> f) => f(status, data);

  WidgetDataState<NT2> mapData<NT2>(Function1<DATA?, NT2> f) =>
      WidgetDataState(status, f(data));

  WidgetDataState<DATA> changeStatus(
          Function1<WidgetStatus, WidgetStatus> f) =>
      WidgetDataState(f(status), data);

  WidgetDataState<DATA> changeToInitialStatus() =>
      WidgetDataState(WidgetStatus.initial, data);

  WidgetDataState<DATA> changeToNormalStatus() =>
      WidgetDataState(WidgetStatus.normal, data);

  WidgetDataState<DATA> changeToDisableStatus() =>
      WidgetDataState(WidgetStatus.disabled, data);

  WidgetDataState<DATA> changeToLoadingStatus() =>
      WidgetDataState(WidgetStatus.loading, data);

  WidgetDataState<DATA> changeToEmptyStatus() =>
      WidgetDataState(WidgetStatus.empty, data);

  WidgetDataState<DATA> changeToSuccessStatus() =>
      WidgetDataState(WidgetStatus.success, data);

  WidgetDataState<DATA> changeToFailStatus() =>
      WidgetDataState(WidgetStatus.fail, data);

  WidgetDataState<DATA> copyWith({
    WidgetStatus? status,
    DATA? data,
  }) {
    return WidgetDataState<DATA>(
      status ?? this.status,
      data ?? this.data,
    );
  }

  @override
  String toString() {
    return 'WidgetDataState{status: $status, data: $data}';
  }
}
