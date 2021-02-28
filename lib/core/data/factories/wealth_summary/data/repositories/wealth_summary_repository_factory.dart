import 'package:fliper_flutter_test/core/data/configs/app_config.dart';
import 'package:fliper_flutter_test/core/data/factories/core/drivers/graphql_driver_factory.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/repositories/wealth_summary_repository_impl.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/repositories/wealth_summary_repository.dart';
import 'package:http/http.dart';

WealthSummaryRepository makeWealthSummaryRepository(AppConfig appConfig) =>
    WealthSummaryRepositoryImpl(
      Client(),
      appConfig,
      makeGraphqlDriver(),
    );
