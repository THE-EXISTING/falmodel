// ignore_for_file: constant_identifier_names
import 'package:falmodel/lib.dart';

class Failure extends Equatable {
  final String? code;
  final String? message;
  final String? developMessage;
  final Exception? exception;
  final StackTrace? stacktrace;

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
