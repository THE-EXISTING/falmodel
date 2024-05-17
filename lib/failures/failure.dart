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

  static Failure fromException({
    String? code,
    Object? exception,
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
