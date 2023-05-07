import 'package:falmodel/falmodel.dart';

class FetcherList {
  final Map<dynamic, Fetcher> _fetcherMap = {};

  void fetch<T extends BlocState>({
    required Object key,
    required Stream<T> call,
    required Function(T data) onFetch,
    Function? onError,
    bool newFetch = true,
  }) async {
    _removeFetcherIfClose();

    if (newFetch) {
      _closeFetcherByKey(key);
    }

    Fetcher<T>? fetcher = _fetcherMap[key] as Fetcher<T>?;
    if (fetcher == null) {
      fetcher = Fetcher<T>();
      _fetcherMap[key] = fetcher;
    }

    fetcher.fetch(
      call,
      onFetch: onFetch,
      onError: onError,
    );
  }

  void _closeFetcherByKey(dynamic key) {
    final fetcher = _fetcherMap[key];
    fetcher?.close();
  }

  void _removeFetcherIfClose() {
    _fetcherMap.removeWhere((key, value) => value.isClose);
  }

  void close() {
    _fetcherMap.forEach((key, fetcher) => fetcher.close());
  }
}
