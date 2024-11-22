// ignore_for_file: constant_identifier_names
import 'package:falmodel/lib.dart';

class Failure extends Equatable {
  final String? code;
  final String? message;
  final String? developerMessage;
  final Object? exception;
  final StackTrace? stacktrace;

  const Failure({
    this.code,
    this.message,
    this.developerMessage,
    this.exception,
    this.stacktrace,
  });

  static Failure fromError(
    Error error, {
    String? code,
    StackTrace? stacktrace,
  }) {
    return Failure(
      code: code,
      message: error.toString(),
      developerMessage: error.toString(),
      exception: error,
      stacktrace: stacktrace ?? error.stackTrace ?? StackTrace.current,
    );
  }

  static Failure fromException(
    Object exception, {
    String? code,
    StackTrace? stacktrace,
  }) {
    return Failure(
      code: code,
      message: exception.toString(),
      developerMessage: exception.toString(),
      exception: exception,
      stacktrace: stacktrace ?? StackTrace.current,
    );
  }

  @override
  List<Object?> get props => [
        code,
        message,
        developerMessage,
        exception,
        stacktrace,
      ];
}
