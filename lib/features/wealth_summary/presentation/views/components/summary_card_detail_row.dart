import 'dart:ui';
import 'package:flutter/material.dart';

class SummaryCardDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBlurred;

  const SummaryCardDetailRow({
    Key key,
    this.label = '',
    this.value = '',
    this.isBlurred = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          ImageFiltered(
            imageFilter: isBlurred
                ? ImageFilter.blur(sigmaX: 7, sigmaY: 7)
                : ImageFilter.blur(),
            child: Text(
              value,
              style:
                  Theme.of(context).textTheme.headline5.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
