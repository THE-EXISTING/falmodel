// Created by Nonthawit on 4/7/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

class WidgetState<DATA> {
  WidgetState(
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

  WidgetState<NT2> mapData<NT2>(Function1<DATA, NT2> f) =>
      WidgetState(status, data: f(data));

  WidgetState<DATA> mapStatus(Function1<WidgetStatus, WidgetStatus> f) =>
      WidgetState(f(status), data: data);

  WidgetState<DATA> toStatus(WidgetStatus status) =>
      WidgetState(status, data: data);

  WidgetState<DATA> get toInitial =>
      WidgetState(WidgetStatus.initial, data: data);

  WidgetState<DATA> get toNormal =>
      WidgetState(WidgetStatus.normal, data: data);

  WidgetState<DATA> get toDisabled =>
      WidgetState(WidgetStatus.disabled, data: data);

  WidgetState<DATA> get toLoading =>
      WidgetState(WidgetStatus.loading, data: data);

  WidgetState<DATA> get toEmpty => WidgetState(WidgetStatus.empty, data: data);

  WidgetState<DATA> get toSuccess =>
      WidgetState(WidgetStatus.success, data: data);

  WidgetState<DATA> get toFail => WidgetState(WidgetStatus.fail, data: data);

  /// No copy [event] and [build].
  /// [event] if you want to send event to view, please use [addEvent]
  /// [build] this flag use in view layer.
  WidgetState<DATA> copyWith({
    WidgetStatus? status,
    DATA? data,
    bool? build,
  }) {
    return WidgetState<DATA>(
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
  WidgetState<DATA> addEvent(
    Object event, [
    Object? data,
  ]) {
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
