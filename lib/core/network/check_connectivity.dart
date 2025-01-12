import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnectivity {
  static Future<void> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      // print('Connected to network');
    } else {
      // print('No internet connection');
    }
  }
}
