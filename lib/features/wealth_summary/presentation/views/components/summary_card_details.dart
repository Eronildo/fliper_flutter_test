import 'package:flutter/material.dart';

import 'summary_card_detail_row.dart';

class SummaryCardDetails extends StatelessWidget {
  final String profitability;
  final String cdi;
  final String gain;
  final bool isBlurred;

  const SummaryCardDetails({
    Key key,
    @required this.profitability,
    @required this.cdi,
    @required this.gain,
    this.isBlurred = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          SummaryCardDetailRow(
            label: 'Rentabilidade/mês',
            value: profitability,
            isBlurred: isBlurred,
          ),
          SummaryCardDetailRow(
            label: 'CDI',
            value: cdi,
            isBlurred: isBlurred,
          ),
          SummaryCardDetailRow(
            label: 'Ganho/mês',
            value: gain,
            isBlurred: isBlurred,
          ),
        ],
      ),
    );
  }
}
