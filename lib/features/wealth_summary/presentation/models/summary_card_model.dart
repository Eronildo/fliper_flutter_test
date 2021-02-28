import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';
import 'package:intl/intl.dart';

class SummaryCardModel {
  final String total;
  final String profitability;
  final String cdi;
  final String gain;
  bool isValuesHidden = false;

  SummaryCardModel({
    this.total,
    this.profitability,
    this.cdi,
    this.gain,
  });

  static final _numberFormat =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  static String _currencyFormat(double number) {
    return _numberFormat.format(number);
  }

  static String _percentageFormat(double number, int length) {
    var numberString = number.toString();
    if (numberString.length >= length)
      numberString = numberString.substring(0, length);
    return '${numberString.replaceAll(".", ",")}%';
  }

  factory SummaryCardModel.fromEntity(WealthSummary entity) {
    return SummaryCardModel(
      total: _currencyFormat(entity.total),
      profitability: _percentageFormat(entity.profitability, 5),
      cdi: _percentageFormat(entity.cdi, 4),
      gain: _currencyFormat(entity.gain),
    );
  }
}
