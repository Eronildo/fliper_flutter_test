import 'package:fliper_flutter_test/core/data/configs/app_config.dart';
import 'package:fliper_flutter_test/core/data/factories/wealth_summary/domain/usecases/get_wealth_summary_factory.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_controller.dart';

SummaryController makeSummaryController(AppConfig appConfig) =>
    SummaryController(makeGetWealthSummary(appConfig));
