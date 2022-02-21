import 'package:flutter/material.dart';
import 'package:vbt_camp_widget/feature/httpService/view/post_view.dart';
import 'package:vbt_camp_widget/feature/login/sign_up.dart';
import 'package:vbt_camp_widget/feature/login/view/login_view.dart';

import 'feature/home/view/home_view.dart';
import 'feature/onboard/view/onboard_screen_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            checkboxTheme: CheckboxThemeData(
              overlayColor: MaterialStateProperty.all(Color(0XFF5ABD8C)),
              fillColor: MaterialStateProperty.all(Color(0XFF5ABD8C)),
            ),
            appBarTheme: AppBarTheme(backgroundColor: Color(0XFF5ABD8C)),
            // colorScheme: ColorScheme(primary: Colors.red, primaryVariant: primaryVariant, secondary: secondary, secondaryVariant: secondaryVariant, surface: surface, background: background, error: error, onPrimary: onPrimary, onSecondary: onSecondary, onSurface: onSurface, onBackground: onBackground, onError: onError, brightness: brightness),
            primaryColor: Color(0XFF5ABD8C)),
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: PostView());
  }
}
