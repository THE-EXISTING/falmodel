// ignore_for_file: constant_identifier_names
import 'package:falmodel/lib.dart';

abstract class Failure extends Equatable {
  final String? code;
  final String? message;
  final String? developMessage;
  final Exception? exception;

  const Failure({
    this.code,
    this.message,
    this.developMessage,
    this.exception,
  });

  @override
  List<Object?> get props => [code, message, developMessage, exception];
}
