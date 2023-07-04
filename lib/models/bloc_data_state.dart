// Created by Nonthawit on 4/7/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

abstract class BlocDataState {}

class WidgetEvent<EVENT> extends BlocDataState {
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

class WidgetDataState<DATA> extends BlocDataState {
  WidgetDataState(this.status, this.data);

  final WidgetDisplayState status;
  final DATA data;

  bool get isInitial => status == WidgetDisplayState.initial;

  bool get isNotInitial => !isInitial;

  bool get isNormal => status == WidgetDisplayState.normal;

  bool get isNotNormal => !isNormal;

  bool get isDisabled => status == WidgetDisplayState.disabled;

  bool get isNotDisabled => !isDisabled;

  bool get isLoading => status == WidgetDisplayState.loading;

  bool get isNotLoading => !isLoading;

  bool get isEmpty => status == WidgetDisplayState.empty;

  bool get isNotEmpty => !isEmpty;

  bool get isFail => status == WidgetDisplayState.fail;

  bool get isNotFail => !isFail;

  bool get isSuccess => status == WidgetDisplayState.success;

  bool get isNotSuccess => !isSuccess;

  R apply<R>(Function2<WidgetDisplayState, DATA, R> f) => f(status, data);

  WidgetDataState<NT2> mapData<NT2>(Function1<DATA, NT2> f) =>
      WidgetDataState(status, f(data));

  WidgetDataState<DATA> changeStatus(
          Function1<WidgetDisplayState, WidgetDisplayState> f) =>
      WidgetDataState(f(status), data);

  WidgetDataState<DATA> changeToInitialStatus() =>
      WidgetDataState(WidgetDisplayState.initial, data);

  WidgetDataState<DATA> changeToNormalStatus() =>
      WidgetDataState(WidgetDisplayState.normal, data);

  WidgetDataState<DATA> changeToDisableStatus() =>
      WidgetDataState(WidgetDisplayState.disabled, data);

  WidgetDataState<DATA> changeToLoadingStatus() =>
      WidgetDataState(WidgetDisplayState.loading, data);

  WidgetDataState<DATA> changeToEmptyStatus() =>
      WidgetDataState(WidgetDisplayState.empty, data);

  WidgetDataState<DATA> changeToSuccessStatus() =>
      WidgetDataState(WidgetDisplayState.success, data);

  WidgetDataState<DATA> changeToFailStatus() =>
      WidgetDataState(WidgetDisplayState.fail, data);

  WidgetDataState<DATA> copyWith({
    WidgetDisplayState? status,
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
