import 'package:fliper_flutter_test/features/wealth_summary/presentation/models/summary_card_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../../domain/mocks/wealth_summary_mock.dart';

void main() {
  final _totalCurrencyFormatted =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(3200876);

  test('Should total currency with exactly formatted', () {
    final summaryCardModel =
        SummaryCardModel.fromEntity(WealthSummaryMock.mock);

    expect(summaryCardModel.total, _totalCurrencyFormatted); //R$ 3.200.876,00
  });

  test('Should profitability with percentage formatted', () {
    final summaryCardModel =
        SummaryCardModel.fromEntity(WealthSummaryMock.mock);

    expect(summaryCardModel.profitability, '2,767%');
  });
}
