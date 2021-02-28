import 'package:fliper_flutter_test/core/domain/error/app_errors.dart';
import 'package:fliper_flutter_test/core/domain/services/connection_service.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/repositories/wealth_summary_repository.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/usecases/get_wealth_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RepositoryMock extends Mock implements WealthSummaryRepository {}

class ConnectionServiceMock extends Mock implements ConnectionService {}

void main() {
  final repositoryMock = RepositoryMock();
  final connectionServiceMock = ConnectionServiceMock();
  final getWealthSummary = GetWealthSummaryImpl(
    repositoryMock,
    connectionServiceMock,
  );

  test('Should return a Wealth Summary', () async {
    when(connectionServiceMock.isOnline()).thenAnswer((_) async => true);
    when(repositoryMock.getWealthSummary())
        .thenAnswer((_) async => WealthSummary());
    final wealthSummary = await getWealthSummary();
    expect(wealthSummary, isA<WealthSummary>());
  });

  test('Should throw a Server Error', () {
    when(connectionServiceMock.isOnline()).thenAnswer((_) async => true);
    when(repositoryMock.getWealthSummary()).thenThrow(ServerError());
    expect(() async => await getWealthSummary(), throwsException);
  });

  test('Should throw a Connection Error', () {
    when(connectionServiceMock.isOnline()).thenAnswer((_) async => false);
    expect(() async => await getWealthSummary(), throwsException);
  });
}
