import 'package:bloc/bloc.dart';
import '../../../../core/utils/enums.dart';

class ButtomnavigationbarCubit extends Cubit<SelectedTabNavigationBar> {
  ButtomnavigationbarCubit() : super(SelectedTabNavigationBar.home);

  void setTabIndex(int index) {
    emit(SelectedTabNavigationBar.values[index]);
  }
}
