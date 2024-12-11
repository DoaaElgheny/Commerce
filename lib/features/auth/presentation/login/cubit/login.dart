import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/authentication/provider.dart';
import '../../../domain/entities/login_credentials.dart';
import '../../../domain/entities/social_media_credentials.dart';
import 'states.dart';

final class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitState());

  factory LoginCubit.of(BuildContext context) {
    return BlocProvider.of<LoginCubit>(context);
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    try {
      if (formKey.currentState?.validate() != true) {
        emit(NotValidDataState());
        return;
      }
      final user = await AuthenticationProvider.instance.login(
        credentials: LoginCredentials(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      emit(LoggedInState(user: user));
    } catch (e, s) {
      emit(ExceptionState(error: e));
    }
  }

  Future<void> loginWithSocialMedia(SocialMediaCredentials credentials) async {
    try {
      final user = await AuthenticationProvider.instance
          .loginWithSocialMedia(credentials: credentials);
      emit(LoggedInState(user: user));
    } catch (e, s) {
      emit(ExceptionState(error: e));
    }
  }
}
