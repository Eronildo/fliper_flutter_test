import 'package:fliper_flutter_test/features/wealth_summary/data/models/wealth_summary_model.dart';

class WealthSummaryMock {
  WealthSummaryMock._();

  static WealthSummaryModel get mock => WealthSummaryModel(
      cdi: 3.45679, gain: 1833.23, profitability: 2.76789, total: 3200876);
}
