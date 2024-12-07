part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUploading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {
  final String msg;

  const SignUpError({
    required this.msg,
  });

  @override
// TODO: implement props
  List<Object> get props => [msg];
}
