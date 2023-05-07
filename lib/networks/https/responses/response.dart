import 'dart:convert';
import 'package:falmodel/falmodel.dart';
import 'package:equatable/equatable.dart';

class ResponseX<T> with EquatableMixin {
  /// Response body. may have been transformed, please refer to [ResponseType].
  T data;

  /// Http status code.
  int? statusCode;

  /// Returns the reason phrase associated with the status code.
  /// The reason phrase must be set before the body is written
  /// to. Setting the reason phrase after writing to the body.
  String statusMessage;

  ResponseX({
    this.statusCode,
    required this.data,
    this.statusMessage = '',
  });

  /// We are more concerned about `data` field.
  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }

  @override
  List<Object?> get props => [statusCode, data, statusMessage];
}
