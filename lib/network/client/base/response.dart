import 'package:equatable/equatable.dart';

class NetworkResponse extends Equatable {
  const NetworkResponse({
    required this.statusCode,
    required this.body,
    this.headers = const <String, String>{},
  });

  final int statusCode;
  final String body;
  final Map<String, String> headers;

  @override
  List<Object?> get props {
    return <Object?>[
      statusCode,
      body,
      headers,
    ];
  }
}
