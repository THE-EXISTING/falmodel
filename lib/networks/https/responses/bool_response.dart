import 'package:falmodel/falmodel.dart';
/// {
///   'status': 'true/false'
/// }

class BoolResponse extends ResponseX<bool> {
  BoolResponse({
    required int statusCode,
    required bool status,
  }) : super(statusCode: statusCode, data: status);
}

