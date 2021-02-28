import 'package:fliper_flutter_test/core/data/drivers/connection_driver.dart';
import 'package:fliper_flutter_test/core/domain/services/connection_service.dart';

class ConnectionServiceImpl implements ConnectionService {
  final ConnectionDriver connectionDriver;

  ConnectionServiceImpl(this.connectionDriver);

  @override
  Future<bool> isOnline() {
    return connectionDriver.isOnline;
  }
}
