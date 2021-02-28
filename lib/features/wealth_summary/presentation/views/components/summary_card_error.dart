import 'package:fliper_flutter_test/core/presentation/views/components/card/custom_card.dart';
import 'package:flutter/material.dart';

class SummaryCardError extends StatelessWidget {
  final String errorMessage;
  final VoidCallback tryAgainButtonOnPressed;

  const SummaryCardError({
    Key key,
    this.errorMessage = 'Erro no servidor!',
    this.tryAgainButtonOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      headerTitle: 'Seu resumo',
      cardBody: Text(errorMessage),
      footerButtonTitle: 'Tentar novamente',
      footerButtonOnPressed: tryAgainButtonOnPressed,
    );
  }
}
