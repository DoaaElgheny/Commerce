import 'package:bloc/bloc.dart';

class TermsAndConditionsCubit extends Cubit<bool> {
  TermsAndConditionsCubit() : super(false);

  void acceptTermsAndConditions() {
    emit(true);
  }

  void declineTermsAndConditions() {
    emit(false);
  }
}
