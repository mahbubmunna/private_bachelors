import 'package:flutter/material.dart';
import 'package:privatebachelors/configs/colors.dart';
import 'package:privatebachelors/pages/tabs.dart';

class BesorkariBachelors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _privateBachelorsTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => Tabs(),
      },
    );
  }
}

final ThemeData _privateBachelorsTheme = _buildPrivateBachelorsTheme();

ThemeData _buildPrivateBachelorsTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: privateBachelorPrimary,
    accentColor: privateBachelorAccent,
    buttonTheme: base.buttonTheme.copyWith(buttonColor: privateBachelorAccent),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: privateBachelorPrimary,
    ),
    textSelectionColor: privateBachelorPrimary,
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
    inputDecorationTheme: InputDecorationTheme(
     // border: OutlineInputBorder()
    )
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
      fontSize: 18.0,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
  );
}
