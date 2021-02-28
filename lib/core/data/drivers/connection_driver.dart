import 'package:connectivity/connectivity.dart';

abstract class ConnectionDriver {
  Future<bool> get isOnline;
}

class ConnectionDriverImpl implements ConnectionDriver {
  final Connectivity connectivity;

  ConnectionDriverImpl(this.connectivity);

  @override
  Future<bool> get isOnline async {
    final result = await connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}
