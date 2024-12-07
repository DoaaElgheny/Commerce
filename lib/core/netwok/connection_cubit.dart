import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectionStatus { connected, disconnected, connecting }

class ConnectionCubit extends Cubit<ConnectionStatus> {
  final Connectivity _connectivity = Connectivity();

  ConnectionCubit() : super(ConnectionStatus.connecting) {
    checkConnection();
    _connectivity.onConnectivityChanged.listen((result) {
      checkConnection();
    });
  }

  void checkConnection() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      emit(ConnectionStatus.disconnected);
    } else {
      emit(ConnectionStatus.connected);
    }
  }
}
