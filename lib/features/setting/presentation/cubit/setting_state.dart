
 import 'package:equatable/equatable.dart';

class SettingState extends Equatable {

  @override
  List<Object> get props => [];
}
class Loginloading extends SettingState {}

class LoginSuccess extends SettingState {}

class SettingError extends SettingState {
 final String msg;

 SettingError({required this.msg,});

 @override
// TODO: implement props
 List<Object> get props => [msg];
}

