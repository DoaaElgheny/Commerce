import 'package:equatable/equatable.dart';

base class LogoutParameters extends Equatable {
  const LogoutParameters({
    required this.token,
  });

  final String token;

  @override
  List<Object> get props {
    return <Object>[
      token,
    ];
  }
}
