import 'package:fliper_flutter_test/core/data/drivers/graphql_driver.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/graphql_queries/wealth_summary_queries.dart';

GraphqlDriver makeGraphqlDriver() =>
    GraphqlDriverImpl(WealthSummaryQueries.summaryQuery);
