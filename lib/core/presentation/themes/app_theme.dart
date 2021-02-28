import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get themeData {
    final primaryColor = Color(0xFF3B5CB8);
    final primaryColorDark = Color(0xFF606377);
    final primaryColorLight = Color(0xFF9AA3BC);
    final scaffoldBackgroundColor = Color(0xFFE8EBF6);

    final secondaryColor = Color(0xFF6DA1F8);

    final textTheme = TextTheme(
      headline5: TextStyle(
        color: primaryColor,
        fontSize: 25,
        fontWeight: FontWeight.w900,
      ),
      headline6: TextStyle(
        color: primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.w900,
      ),
      bodyText2: TextStyle(
        color: primaryColorDark,
        fontSize: 16,
      ),
    );

    final dividerTheme = DividerThemeData(
      color: primaryColorLight,
      thickness: 0.5,
      space: 0.0,
    );

    final buttonTheme = ButtonThemeData(
      colorScheme: ColorScheme.light(primary: primaryColor),
      buttonColor: primaryColor,
      splashColor: scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      textTheme: ButtonTextTheme.primary,
      shape: StadiumBorder(
        side: BorderSide(color: primaryColor, width: 2.0),
      ),
    );

    final floatingActionButtonTheme =
        FloatingActionButtonThemeData(backgroundColor: primaryColor);

    final iconTheme = IconThemeData(color: primaryColorLight);

    final cardTheme = CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 3,
    );

    return ThemeData(
      fontFamily: 'ProximaNova',
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      secondaryHeaderColor: secondaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      backgroundColor: scaffoldBackgroundColor,
      textTheme: textTheme,
      dividerTheme: dividerTheme,
      buttonTheme: buttonTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      iconTheme: iconTheme,
      accentColor: primaryColor,
      disabledColor: primaryColorLight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: cardTheme,
    );
  }
}
