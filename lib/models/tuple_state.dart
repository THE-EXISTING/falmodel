// Created by Nonthawit on 18/6/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

abstract class TupleState<DATA> with EquatableMixin {
  TupleState(this.status, this.data);

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

  mapData<NT2>(Function1<DATA, NT2> f);

  changeStatus(Function1<WidgetDisplayState, WidgetDisplayState> f);

  changeToInitialStatus();

  changeToNormalStatus();

  changeToDisableStatus();

  changeToLoadingStatus();

  changeToEmptyStatus();

  changeToSuccessStatus();

  changeToFailStatus();

  copyWith({
    WidgetDisplayState? status,
    DATA? data,
  });

  @override
  List<Object?> get props => [status, data];

  @override
  bool? get stringify => true;
}
