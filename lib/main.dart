import 'package:flutter/material.dart';

import 'feature/onboard/view/onboard_screen_view.dart';
import 'feature/widget/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            // colorScheme: ColorScheme(primary: Colors.red, primaryVariant: primaryVariant, secondary: secondary, secondaryVariant: secondaryVariant, surface: surface, background: background, error: error, onPrimary: onPrimary, onSecondary: onSecondary, onSurface: onSurface, onBackground: onBackground, onError: onError, brightness: brightness),
            primaryColor: Color(0XFF5ABD8C)),
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: OnBoardScreen());
  }
}
