import 'dart:convert';
import 'package:falmodel/falmodel.dart';

abstract class SocketBody extends BaseRequest {
  const SocketBody();

  Map<String, Object?> toJson();

  String toJsonStr() => json.encode(toJson());
}
