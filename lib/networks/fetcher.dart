import 'dart:async';
import 'package:falmodel/falmodel.dart';
import 'package:faltool/faltool.dart';

class Fetcher<T extends BlocState> {
  StreamSubscriptionWrapper? subscription;

  bool get isClose => subscription?.isClosed ?? true;

  void fetch(
    Stream<T> call, {
    required Function(T data) onFetch,
    Function? onError,
  }) async {
    if (subscription != null) {
      subscription?.cancel();
    }
    subscription = StreamSubscriptionWrapper<T>(
      call,
      onData: (T data) {
        final status = data.status;
        if (status == BlocStatus.error || status == BlocStatus.success) {
          subscription?.cancel();
        }
        onFetch(data);
      },
      onError: onError ??
          (error, stacktrace) {
            Log.e(error, stacktrace);
          },
      onDone: () {
        Log.success('Fetch onDone');
      },
    );
  }

  void close() {
    subscription?.cancel();
  }
}
