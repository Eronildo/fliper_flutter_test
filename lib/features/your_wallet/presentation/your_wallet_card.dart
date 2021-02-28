import 'package:fliper_flutter_test/core/presentation/views/components/card/custom_card.dart';
import 'package:flutter/material.dart';

import 'components/your_wallet_item.dart';

class YourWalletCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      headerTitle: 'Sua carteira',
      cardBody: Column(
        children: [
          YourWalletItem(
            title: 'Renda fixa',
            amount: 30,
          ),
          YourWalletItem(
            title: 'Renda varável',
            amount: 70,
          ),
        ],
      ),
    );
  }
}
