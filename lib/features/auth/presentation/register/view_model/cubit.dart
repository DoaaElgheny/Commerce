import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/authentication/provider.dart';
import '../../../../../di/dependency_injector.dart';
import '../../../../user/domain/entities/profile_modification_data.dart';
import '../../../../user/domain/use_cases/update_profile.dart';
import '../../../domain/entities/register_credentials.dart';
import 'state.dart';

final class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitState());

  factory RegisterCubit.of(BuildContext context) {
    return BlocProvider.of<RegisterCubit>(context);
  }

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register() async {
    try {
      if (formKey.currentState?.validate() != true) {
        emit(NotValidDataState());
        return;
      }
      final user = await AuthenticationProvider.instance.register(
        credentials: RegisterCredentials(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          passwordConfirmation: confirmPasswordController.text,
        ),
      );

      emit(RegisteredState(user: user));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }

  Future<void> complete() async {
    try {
      if (formKey.currentState?.validate() != true) {
        emit(NotValidDataState());
        return;
      }

      await UpdateProfile(repository: DependencyInjector.userRepository).call(
        parameter: ProfileModificationData(
          userId: AuthenticationProvider.instance.currentUser!.details.id,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: AuthenticationProvider.instance.currentUser!.details.email,
          phone: phoneController.text,
        ),
      );
      await AuthenticationProvider.instance.refreshUser();
      emit(CompleteState(user: AuthenticationProvider.instance.currentUser!));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }
}
