import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String graphqlEndPoint;
  final String hasuraSecret;

  AppConfig({this.graphqlEndPoint = '', this.hasuraSecret = ''});

  Future<AppConfig> load() async {
    final contents = await rootBundle.loadString(
      'assets/configs/app_config.json',
    );

    final json = jsonDecode(contents);

    return AppConfig(
      graphqlEndPoint: json['graphql_end_point'],
      hasuraSecret: json['hasura_secret'],
    );
  }
}
