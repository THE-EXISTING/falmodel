// Created by Nonthawit on 4/7/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

class WidgetState<DATA> {
  WidgetState(
    this.status, {
    this.event,
    this.data,
    this.build = true,
  });

  final WidgetStatus status;
  final WidgetEvent? event;
  final DATA? data;
  final bool build;

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

  WidgetState<NT2> mapData<NT2>(Function1<DATA?, NT2> f) =>
      WidgetState(status, data: f(data));

  WidgetState<DATA> changeStatus(Function1<WidgetStatus, WidgetStatus> f) =>
      WidgetState(f(status), data: data);

  WidgetState<DATA> changeToInitialStatus() =>
      WidgetState(WidgetStatus.initial, data: data);

  WidgetState<DATA> changeToNormalStatus() =>
      WidgetState(WidgetStatus.normal, data: data);

  WidgetState<DATA> changeToDisableStatus() =>
      WidgetState(WidgetStatus.disabled, data: data);

  WidgetState<DATA> changeToLoadingStatus() =>
      WidgetState(WidgetStatus.loading, data: data);

  WidgetState<DATA> changeToEmptyStatus() =>
      WidgetState(WidgetStatus.empty, data: data);

  WidgetState<DATA> changeToSuccessStatus() =>
      WidgetState(WidgetStatus.success, data: data);

  WidgetState<DATA> changeToFailStatus() =>
      WidgetState(WidgetStatus.fail, data: data);

  WidgetState<DATA> copyWith({
    WidgetStatus? status,
    DATA? data,
    WidgetEvent? event,
    bool? build,
  }) {
    return WidgetState<DATA>(
      status ?? this.status,
      event: event, //No copy event
      data: data ?? this.data,
      build: build ?? true, //No copy build
    );
  }

  WidgetState<DATA> addEvent({
    required Object event,
    Object? data,
  }) {
    return WidgetState<DATA>(
      this.status,
      event: WidgetEvent(event, data),
      data: this.data,
      build: this.build,
    );
  }

  @override
  String toString() {
    return 'WidgetState{status: $status, data: $data, event: $event, build: $build}';
  }
}

class WidgetEvent {
  WidgetEvent(
    this.event,
    this.data,
  );

  final Object event;
  final Object? data;

  @override
  String toString() {
    return 'WidgetEvent{data: $data}';
  }
}
