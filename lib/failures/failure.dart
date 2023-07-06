// ignore_for_file: constant_identifier_names
import 'package:falmodel/lib.dart';

class Failure extends Equatable {
  final String? code;
  final String? message;
  final String? developMessage;
  final Object? exception;
  final StackTrace? stacktrace;

  static Failure fromException({
    String? code,
    Object? exception,
    StackTrace? stacktrace,
  }) {
    return Failure(
      code: code,
      message: exception.toString(),
      developMessage: exception.toString(),
      exception: exception,
      stacktrace: stacktrace,
    );
  }

  const Failure({
    this.code,
    this.message,
    this.developMessage,
    this.exception,
    this.stacktrace,
  });

  @override
  List<Object?> get props => [
        code,
        message,
        developMessage,
        exception,
        stacktrace,
      ];
}
