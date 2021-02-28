import 'package:fliper_flutter_test/core/data/configs/app_config.dart';
import 'package:fliper_flutter_test/core/data/factories/core/services/connection_service_factory.dart';
import 'package:fliper_flutter_test/core/data/factories/wealth_summary/data/repositories/wealth_summary_repository_factory.dart';
import 'package:fliper_flutter_test/features/wealth_summary/domain/usecases/get_wealth_summary.dart';

GetWealthSummary makeGetWealthSummary(AppConfig appConfig) =>
    GetWealthSummaryImpl(
        makeWealthSummaryRepository(appConfig), makeConnectionService());
