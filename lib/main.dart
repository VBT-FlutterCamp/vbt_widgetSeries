import 'package:flutter/material.dart';

import 'feature/widget/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            // colorScheme: ColorScheme(primary: Colors.red, primaryVariant: primaryVariant, secondary: secondary, secondaryVariant: secondaryVariant, surface: surface, background: background, error: error, onPrimary: onPrimary, onSecondary: onSecondary, onSurface: onSurface, onBackground: onBackground, onError: onError, brightness: brightness),
            primaryColor: Colors.red),
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: HomeView());
  }
}
