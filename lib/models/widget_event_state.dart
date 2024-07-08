// Created by Nonthawit on 4/7/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';
import 'package:flutter/widgets.dart';

enum FullWidgetState {
  initial,
  normal,
  empty,
  hovered,
  focused,
  pressed,
  dragged,
  selected,
  scrolledUnder,
  disabled,
  loading,
  success,
  fail,
}

@immutable
class WidgetEventState<DATA> {
  const WidgetEventState(
    this.state, {
    this.event,
    required this.data,
    this.build = true,
  });

  final FullWidgetState state;
  final WidgetEvent? event;
  final DATA data;
  final bool build;

  bool get isInitial => state == FullWidgetState.initial;

  bool get isNormal => state == FullWidgetState.normal;

  bool get isEmpty => state == FullWidgetState.empty;

  bool get isHovered => state == FullWidgetState.hovered;

  bool get isFocused => state == FullWidgetState.focused;

  bool get isPressed => state == FullWidgetState.pressed;

  bool get isDragged => state == FullWidgetState.dragged;

  bool get isSelected => state == FullWidgetState.selected;

  bool get isScrolledUnder => state == FullWidgetState.scrolledUnder;

  bool get isDisabled => state == FullWidgetState.disabled;

  bool get isLoading => state == FullWidgetState.loading;

  bool get isSuccess => state == FullWidgetState.success;

  bool get isFail => state == FullWidgetState.fail;

  bool get isNotInitial => !isInitial;

  bool get isNotNormal => !isNormal;

  bool get isNotEmpty => !isEmpty;

  bool get isNotHovered => !isHovered;

  bool get isNotFocused => !isFocused;

  bool get isNotPressed => !isPressed;

  bool get isNotDragged => !isDragged;

  bool get isNotSelected => !isSelected;

  bool get isNotScrolledUnder => !isScrolledUnder;

  bool get isNotDisabled => !isDisabled;

  bool get isNotLoading => !isLoading;

  bool get isNotSuccess => !isSuccess;

  bool get isNotFail => !isFail;

  bool get hasData => data != null;

  R apply<R>(Function2<FullWidgetState, DATA, R> f) => f(state, data);

  WidgetEventState<NT2> mapData<NT2>(Function1<DATA, NT2> f) =>
      WidgetEventState(state, data: f(data));

  WidgetEventState<DATA> mapState(
          Function1<FullWidgetState, FullWidgetState> f) =>
      WidgetEventState(f(state), data: data);

  WidgetEventState<DATA> toState(FullWidgetState state) =>
      WidgetEventState(state, data: data);

  WidgetEventState<DATA> get toInitial =>
      WidgetEventState(FullWidgetState.initial, data: data);

  WidgetEventState<DATA> get toNormal =>
      WidgetEventState(FullWidgetState.normal, data: data);

  WidgetEventState<DATA> get toLoading =>
      WidgetEventState(FullWidgetState.loading, data: data);

  WidgetEventState<DATA> get toEmpty =>
      WidgetEventState(FullWidgetState.empty, data: data);

  WidgetEventState<DATA> get toSuccess =>
      WidgetEventState(FullWidgetState.success, data: data);

  WidgetEventState<DATA> get toFail =>
      WidgetEventState(FullWidgetState.fail, data: data);

  /// No copy [event] and [build].
  /// [event] if you want to send event to view, please use [addEvent]
  /// [build] this flag use in view layer.
  WidgetEventState<DATA> copy({
    FullWidgetState? state,
    DATA? data,
    bool? build,
  }) {
    return WidgetEventState<DATA>(
      state ?? this.state,
      data: data ?? this.data,
      build: build ?? true,
    );
  }

  /// In your [buildWhen] in BLoC
  /// Recommend:
  /// ```
  /// if (current is FullWidgetState && current.event != null) {
  ///   return false;
  /// } else if (current is FullWidgetState && current.event == null) {
  ///   return current.build;
  /// } else {
  ///   return true;
  /// }
  /// ```
  WidgetEventState<DATA> addEvent(
    Object event, [
    Object? data,
  ]) =>
      WidgetEventState<DATA>(
        this.state,
        event: WidgetEvent(event, data),
        data: this.data,
        build: this.build,
      );

  @override
  String toString() {
    return 'WidgetEventState{state: $state, data: $data, event: $event, build: $build}';
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
