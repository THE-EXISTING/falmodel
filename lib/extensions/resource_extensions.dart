import 'package:falmodel/lib.dart';

extension ResourceExtension<T extends BlocState> on Stream<T> {
  StreamSubscription<T> listenRealtimeResource({
    required void Function(T data) onData,
    Function? onError,
  }) {
    StreamSubscription<T>? subscription;
    subscription = listen((T data) {
      final status = data.status;
      if (status == BlocStatus.fail) {
        if (onError != null && data.error != null) {
          onError(data.error!, data.stacktrace);
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
    return map((resource) => resource.copy(convert(resource)));
  }
}
