import 'dart:ui';

import 'package:flutter/material.dart';

class SummaryCardTotal extends StatelessWidget {
  final String total;
  final bool isBlurred;

  const SummaryCardTotal({
    Key key,
    @required this.total,
    this.isBlurred = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Valor investido'),
        Padding(
          padding: const EdgeInsets.only(top: 7.0),
          child: ImageFiltered(
            imageFilter: isBlurred
                ? ImageFilter.blur(sigmaX: 7, sigmaY: 7)
                : ImageFilter.blur(),
            child: Text(
              total,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ],
    );
  }
}
