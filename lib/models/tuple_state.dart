// Created by Nonthawit on 18/6/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

abstract class TupleState<DATA> with EquatableMixin {
  const TupleState(this.status, this.data);

  final WidgetStatus status;
  final DATA data;

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

  mapData<NT2>(Function1<DATA, NT2> f);

  changeStatus(Function1<WidgetStatus, WidgetStatus> f);

  changeToInitialStatus();

  changeToNormalStatus();

  changeToDisableStatus();

  changeToLoadingStatus();

  changeToEmptyStatus();

  changeToSuccessStatus();

  changeToFailStatus();

  copyWith({
    WidgetStatus? status,
    DATA? data,
  });

  @override
  List<Object?> get props => [status, data];

  @override
  bool? get stringify => true;
}
