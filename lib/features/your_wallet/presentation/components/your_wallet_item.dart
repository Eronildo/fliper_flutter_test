import 'package:flutter/material.dart';

class YourWalletItem extends StatelessWidget {
  final String title;
  final double amount;

  const YourWalletItem({
    Key key,
    this.title = '',
    this.amount = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 14.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: amount),
              child: Text(
                '$amount%',
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ],
        ),
      ],
    );
  }
}
