import 'package:falmodel/falmodel.dart';

/// {
///   'string': 'string'
/// }

class StringResponse extends ResponseX<String> {
  StringResponse({
    required int statusCode,
    required String string,
  }) : super(statusCode: statusCode, data: string);
}

