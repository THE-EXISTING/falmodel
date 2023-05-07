import 'package:falmodel/falmodel.dart';

class SocketResponseX extends BaseRequest {
  const SocketResponseX({
    required this.requestOptions,
    required this.data,
  });

  final SocketOptions requestOptions;
  final String data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocketResponseX &&
          runtimeType == other.runtimeType &&
          requestOptions == other.requestOptions &&
          data == other.data);

  @override
  int get hashCode => requestOptions.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'SocketResponse{options: $requestOptions, data: $data,}';
  }

  @override
  List<Object?> get props => [requestOptions, data];
}
