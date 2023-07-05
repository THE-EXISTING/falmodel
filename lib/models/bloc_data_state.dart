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

  final WidgetState status;
  final DATA? data;

  bool get isInitial => status == WidgetState.initial;

  bool get isNotInitial => !isInitial;

  bool get isNormal => status == WidgetState.normal;

  bool get isNotNormal => !isNormal;

  bool get isDisabled => status == WidgetState.disabled;

  bool get isNotDisabled => !isDisabled;

  bool get isLoading => status == WidgetState.loading;

  bool get isNotLoading => !isLoading;

  bool get isEmpty => status == WidgetState.empty;

  bool get isNotEmpty => !isEmpty;

  bool get isFail => status == WidgetState.fail;

  bool get isNotFail => !isFail;

  bool get isSuccess => status == WidgetState.success;

  bool get isNotSuccess => !isSuccess;

  R apply<R>(Function2<WidgetState, DATA?, R> f) => f(status, data);

  WidgetDataState<NT2> mapData<NT2>(Function1<DATA?, NT2> f) =>
      WidgetDataState(status, f(data));

  WidgetDataState<DATA> changeStatus(
          Function1<WidgetState, WidgetState> f) =>
      WidgetDataState(f(status), data);

  WidgetDataState<DATA> changeToInitialStatus() =>
      WidgetDataState(WidgetState.initial, data);

  WidgetDataState<DATA> changeToNormalStatus() =>
      WidgetDataState(WidgetState.normal, data);

  WidgetDataState<DATA> changeToDisableStatus() =>
      WidgetDataState(WidgetState.disabled, data);

  WidgetDataState<DATA> changeToLoadingStatus() =>
      WidgetDataState(WidgetState.loading, data);

  WidgetDataState<DATA> changeToEmptyStatus() =>
      WidgetDataState(WidgetState.empty, data);

  WidgetDataState<DATA> changeToSuccessStatus() =>
      WidgetDataState(WidgetState.success, data);

  WidgetDataState<DATA> changeToFailStatus() =>
      WidgetDataState(WidgetState.fail, data);

  WidgetDataState<DATA> copyWith({
    WidgetState? status,
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
