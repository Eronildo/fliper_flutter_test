import 'dart:io';
import 'dart:convert';

import 'package:fliper_flutter_test/core/data/configs/app_config.dart';
import 'package:fliper_flutter_test/core/data/drivers/graphql_driver.dart';
import 'package:fliper_flutter_test/core/domain/error/app_errors.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/repositories/wealth_summary_repository.dart';
import 'package:http/http.dart';
import '../models/wealth_summary_model.dart';

class WealthSummaryRepositoryImpl implements WealthSummaryRepository {
  final Client client;
  final AppConfig appConfig;
  final GraphqlDriver graphqlDriver;

  WealthSummaryRepositoryImpl(this.client, this.appConfig, this.graphqlDriver);

  final _hasuraSecretHeader = 'x-hasura-admin-secret';
  final _jsonHeaderValue = 'application/json';

  @override
  Future<WealthSummaryModel> getWealthSummary() async {
    final response = await client.post(
      appConfig.graphqlEndPoint,
      headers: {
        HttpHeaders.contentTypeHeader: _jsonHeaderValue,
        _hasuraSecretHeader: appConfig.hasuraSecret,
      },
      body: graphqlDriver.toJson(),
    );
    if (response.statusCode == HttpStatus.ok) {
      final bodyMap = json.decode(response.body) as Map<String, dynamic>;
      if (bodyMap.containsKey('data'))
        return WealthSummaryModel.fromMap(bodyMap['data']['wealthSummary'][0]);
    }
    throw ServerError(message: "Erro ao tentar carregar os dados.");
  }
}
