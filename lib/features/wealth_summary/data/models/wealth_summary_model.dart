import 'package:fliper_flutter_test/features/wealth_summary/domain/entities/wealth_summary.dart';

class WealthSummaryModel extends WealthSummary {
  final double total;
  final double profitability;
  final double cdi;
  final double gain;

  WealthSummaryModel({
    this.total,
    this.profitability,
    this.cdi,
    this.gain,
  });

  factory WealthSummaryModel.fromMap(Map<String, dynamic> json) =>
      WealthSummaryModel(
        total: json["total"].toDouble(),
        profitability: json["profitability"].toDouble(),
        cdi: json["cdi"].toDouble(),
        gain: json["gain"].toDouble(),
      );
}
