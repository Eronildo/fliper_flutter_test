import 'package:fliper_flutter_test/core/presentation/views/components/card/card_button.dart';
import 'package:flutter/material.dart';

import 'card_footer.dart';
import 'card_header.dart';

class CustomCard extends StatelessWidget {
  final String headerTitle;
  final Widget headerActionButton;
  final Widget cardBody;
  final String footerButtonTitle;
  final VoidCallback footerButtonOnPressed;

  const CustomCard({
    Key key,
    this.headerTitle = '',
    this.headerActionButton,
    this.cardBody,
    this.footerButtonTitle = '',
    this.footerButtonOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: [
            CardHeader(
              title: headerTitle,
              actionButton: headerActionButton,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: cardBody ?? SizedBox(height: 40.0),
                  ),
                  Visibility(
                    visible: footerButtonTitle.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Divider(),
                    ),
                  ),
                  Visibility(
                    visible: footerButtonTitle.isNotEmpty,
                    child: CardFooter(
                      cardButton: CardButton(
                        title: footerButtonTitle,
                        onPressed: footerButtonOnPressed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      );
}
