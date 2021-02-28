import 'package:fliper_flutter_test/core/data/factories/core/drivers/connection_driver_factory.dart';
import 'package:fliper_flutter_test/core/data/services/connection_service_impl.dart';
import 'package:fliper_flutter_test/core/domain/services/connection_service.dart';

ConnectionService makeConnectionService() =>
    ConnectionServiceImpl(makeConnectionDriver());
