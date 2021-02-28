import 'package:fliper_flutter_test/core/data/drivers/connection_driver.dart';
import 'package:fliper_flutter_test/core/data/services/connection_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ConnectionDriverMock extends Mock implements ConnectionDriver {}

void main() {
  final connectionDriverMock = ConnectionDriverMock();
  final connectionService = ConnectionServiceImpl(connectionDriverMock);

  test('Should return is online true', () async {
    when(connectionDriverMock.isOnline).thenAnswer((_) async => true);
    final result = await connectionService.isOnline();
    expect(result, isTrue);
  });

  test('Should return is online false', () async {
    when(connectionDriverMock.isOnline).thenAnswer((_) async => false);
    final result = await connectionService.isOnline();
    expect(result, isFalse);
  });
}
