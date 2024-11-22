import 'package:falmodel/lib.dart';

extension ResourceExtension<T extends WidgetStateEvent> on Stream<T> {
  StreamSubscription<T> listenRealtimeResource({
    required void Function(T data) onData,
    Function? onError,
  }) {
    StreamSubscription<T>? subscription;
    subscription = listen((T data) {
      final state = data.state;
      if (state == FullWidgetState.fail) {
        if (onError != null) {
          onError(data.data);
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
}
