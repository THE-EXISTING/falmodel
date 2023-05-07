import 'dart:convert';
import 'package:falmodel/falmodel.dart';
import 'package:dio/dio.dart';

abstract class FormDataBodyX extends BaseRequest {
  const FormDataBodyX();

  Map<String, Object?> toJson();

  String toJsonStr() => json.encode(toJson());

  Future<FormData> toFormData();
}
