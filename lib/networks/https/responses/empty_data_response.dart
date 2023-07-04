import 'package:falmodel/lib.dart';

class EmptyResponse extends Response<Object> {
  EmptyResponse({
    super.data = '',
    super.statusCode,
    super.statusMessage,
    RequestOptions? requestOptions,
    super.isRedirect,
    super.redirects,
    super.extra,
    Headers? headers,
  }) : super(requestOptions: requestOptions ?? RequestOptions());
}
