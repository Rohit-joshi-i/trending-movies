import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  final Connectivity _connectivity = Connectivity();

  Future<bool> hasInternet() async {
    final result = await _connectivity.checkConnectivity();
    if (result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        if (result[i] == ConnectivityResult.mobile ||
            result[i] == ConnectivityResult.wifi) {
          return true;
        }
      }
    }
    return false;
  }
}
