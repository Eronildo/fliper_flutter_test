import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CardButton({
    Key key,
    this.title = '',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(1.0, 1.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: OutlineButton(
        onPressed: onPressed,
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1.1,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        // shape: StadiumBorder(),
      ),
    );
  }
}
