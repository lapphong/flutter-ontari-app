import 'package:flutter/material.dart';

import 'app_color.dart';

ThemeData themeData(bool isDarkTheme, BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: isDarkTheme ? DarkTheme.greyScale900 : DarkTheme.white,
    fontFamily: 'manrope',
    textTheme: isDarkTheme
        ? Theme.of(context).textTheme.apply(
              bodyColor: DarkTheme.white,
              displayColor: DarkTheme.white,
            )
        : Theme.of(context).textTheme.apply(
              bodyColor: DarkTheme.greyScale700,
              displayColor: DarkTheme.greyScale700,
            ),
  );
}
