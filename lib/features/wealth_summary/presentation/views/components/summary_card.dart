import 'package:fliper_flutter_test/core/presentation/views/components/card/custom_card.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/models/summary_card_model.dart';
import 'package:flutter/material.dart';

import 'summary_card_details.dart';
import 'summary_card_total.dart';

class SummaryCard extends StatelessWidget {
  final SummaryCardModel model;

  const SummaryCard({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomCard(
        headerTitle: 'Seu resumo',
        headerActionButton: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
        cardBody: Column(
          children: [
            SummaryCardTotal(
              total: model.total,
              isBlurred: model.isValuesHidden,
            ),
            SummaryCardDetails(
              cdi: model.cdi,
              gain: model.gain,
              profitability: model.profitability,
              isBlurred: model.isValuesHidden,
            ),
          ],
        ),
        footerButtonTitle: 'VER MAIS',
        footerButtonOnPressed: () {},
      );
}
