import 'package:fliper_flutter_test/core/presentation/views/components/card/card_button.dart';
import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  final CardButton cardButton;

  const CardFooter({Key key, this.cardButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          cardButton,
        ],
      ),
    );
  }
}
