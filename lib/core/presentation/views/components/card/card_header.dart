import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final String title;
  final Widget actionButton;

  const CardHeader({
    Key key,
    this.title = '',
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 24.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            actionButton ?? SizedBox(height: 40.0,),
          ],
        ),
      );
}
