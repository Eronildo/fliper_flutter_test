import 'package:connectivity/connectivity.dart';
import 'package:fliper_flutter_test/core/data/drivers/connection_driver.dart';

ConnectionDriver makeConnectionDriver() => ConnectionDriverImpl(Connectivity());
