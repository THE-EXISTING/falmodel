import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:falmodel/falmodel.dart';
import 'package:faltool/faltool.dart';

abstract class UniqueModelX<T> extends ModelX<T> {
  UniqueModelX({String? id}) : id = id ?? UniqueKeyX.generateUuid();

  final String id;
}
