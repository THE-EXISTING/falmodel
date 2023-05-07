
import 'package:falmodel/falmodel.dart';

abstract class FirebaseModel with EquatableMixin {
  const FirebaseModel();


  Map<String, dynamic> toMap();


  @override
  bool get stringify => true;
}