import 'dart:convert';
import 'package:falmodel/falmodel.dart';

abstract class RequestBodyX extends BaseRequest {
  const RequestBodyX();

  Map<String, Object?> toJson();

  String toJsonStr() => json.encode(toJson());
}
