terial.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/authentication/provider.dart';
import '../../../domain/entities/register_credentials.dart';
import 'state.dart';

final class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitState());

  factory RegisterCubit.of(BuildContext context) {
    return BlocProvider.of<RegisterCubit>(context);
  }

  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register() async {
    try {
      if (formKey.currentState?.validate() != true) {
        emit(NotValidDataState());
        return;
      }
      if (phoneController.text.isEmpty) {
        emit(NotValidDataState());
        return;
      }
      final user = await AuthenticationProvider.instance.register(
        credentials: RegisterCredentials(
          fullName: fullNameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
        ),
      );

      emit(RegisteredState(user: user));
    } catch (e) {
      emit(ExceptionState(error: e));
    }
  }
}
