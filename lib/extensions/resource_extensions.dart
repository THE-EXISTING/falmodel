import 'dart:async';
import 'package:falmodel/falmodel.dart';

extension ResourceExtension<T extends BlocState> on Stream<T> {
  StreamSubscription<T> listenRealtimeResource({
    required void Function(T data) onData,
    Function? onError,
  }) {
    StreamSubscription<T>? subscription;
    subscription = listen((T data) {
      final status = data.status;
      if (status == BlocStatus.error) {
        if (onError != null && data.error != null) {
          onError(data.error!, data.stackTrace);
        }
      }
      onData(data);
    }, onError: (error, stackTrace) {
      if (onError != null) {
        onError(error, stackTrace);
      }
    }, onDone: () {
      subscription?.cancel();
    });
    return subscription;
  }

  Stream<BlocState<S>> mapToResource<S>(S? Function(T resource) convert) {
    return map((resource) => resource.transformData(convert(resource)));
  }
}
