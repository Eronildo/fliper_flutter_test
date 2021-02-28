import 'dart:io';

import 'package:fliper_flutter_test/core/data/configs/app_config.dart';
import 'package:fliper_flutter_test/core/data/drivers/graphql_driver.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/repositories/wealth_summary_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';

import '../mocks/wealth_summary_json.dart';

class HttpClientMock extends Mock implements Client {}

class AppConfigMock extends Mock implements AppConfig {}

class GraphqlDriverMock extends Mock implements GraphqlDriver {}

void main() {
  final clientMock = HttpClientMock();
  final appConfigMock = AppConfigMock();
  final graphqlDriverMock = GraphqlDriverMock();
  final repository = WealthSummaryRepositoryImpl(
    clientMock,
    appConfigMock,
    graphqlDriverMock,
  );

  test('Should return a Wealth Summary Model', () async {
    when(clientMock.post(any,
            body: anyNamed('body'), headers: anyNamed('headers')))
        .thenAnswer(
      (_) async => Response(
        WealthSummaryJson.json,
        HttpStatus.ok,
      ),
    );
    final wealthSummary = await repository.getWealthSummary();
    expect(wealthSummary.total, equals(3200876));
  });

  test('Should return a Server Exception', () async {
    when(clientMock.post(any,
            body: anyNamed('body'), headers: anyNamed('headers')))
        .thenAnswer((_) async => Response('', HttpStatus.badRequest));
    final future = repository.getWealthSummary();
    expect(() => future, throwsException);
  });
}
