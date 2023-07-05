// Created by Nonthawit on 18/6/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

abstract class TupleState<DATA> with EquatableMixin {
  const TupleState(this.status, this.data);

  final WidgetState status;
  final DATA data;

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

  R apply<R>(Function2<WidgetState, DATA, R> f) => f(status, data);

  mapData<NT2>(Function1<DATA, NT2> f);

  changeStatus(Function1<WidgetState, WidgetState> f);

  changeToInitialStatus();

  changeToNormalStatus();

  changeToDisableStatus();

  changeToLoadingStatus();

  changeToEmptyStatus();

  changeToSuccessStatus();

  changeToFailStatus();

  copyWith({
    WidgetState? status,
    DATA? data,
  });

  @override
  List<Object?> get props => [status, data];

  @override
  bool? get stringify => true;
}
