import 'package:falmodel/falmodel.dart';

class EmptyResponse extends ResponseX<Object> {
  EmptyResponse({
    required int statusCode,
  }) : super(statusCode: statusCode, data: '');
}
