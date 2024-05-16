// Created by Nonthawit on 4/7/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

class WidgetEventState<DATA> {
  WidgetEventState(
    this.status, {
    this.event,
    required this.data,
    this.build = true,
  });

  final WidgetStatus status;
  final WidgetEvent? event;
  final DATA data;
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

  R apply<R>(Function2<WidgetStatus, DATA, R> f) => f(status, data);

  WidgetEventState<NT2> mapData<NT2>(Function1<DATA, NT2> f) =>
      WidgetEventState(status, data: f(data));

  WidgetEventState<DATA> mapStatus(Function1<WidgetStatus, WidgetStatus> f) =>
      WidgetEventState(f(status), data: data);

  WidgetEventState<DATA> toStatus(WidgetStatus status) =>
      WidgetEventState(status, data: data);

  WidgetEventState<DATA> get toInitial =>
      WidgetEventState(WidgetStatus.initial, data: data);

  WidgetEventState<DATA> get toNormal =>
      WidgetEventState(WidgetStatus.normal, data: data);

  WidgetEventState<DATA> get toDisabled =>
      WidgetEventState(WidgetStatus.disabled, data: data);

  WidgetEventState<DATA> get toLoading =>
      WidgetEventState(WidgetStatus.loading, data: data);

  WidgetEventState<DATA> get toEmpty => WidgetEventState(WidgetStatus.empty, data: data);

  WidgetEventState<DATA> get toSuccess =>
      WidgetEventState(WidgetStatus.success, data: data);

  WidgetEventState<DATA> get toFail => WidgetEventState(WidgetStatus.fail, data: data);

  /// No copy [event] and [build].
  /// [event] if you want to send event to view, please use [addEvent]
  /// [build] this flag use in view layer.
  WidgetEventState<DATA> copyWith({
    WidgetStatus? status,
    DATA? data,
    bool? build,
  }) {
    return WidgetEventState<DATA>(
      status ?? this.status,
      data: data ?? this.data,
      build: build ?? true,
    );
  }

  /// In your [buildWhen] in BLoC
  /// Recommend:
  /// ```
  /// if (current is WidgetState && current.event != null) {
  ///   return false;
  /// } else if (current is WidgetState && current.event == null) {
  ///   return current.build;
  /// } else {
  ///   return true;
  /// }
  /// ```
  WidgetEventState<DATA> addEvent(
    Object event, [
    Object? data,
  ]) {
    return WidgetEventState<DATA>(
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
    this.name, [
    this.data,
  ]);

  final Object name;
  final Object? data;

  @override
  String toString() {
    return 'WidgetEvent{event: $name, data: $data}';
  }
}
