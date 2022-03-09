import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vbt_camp_widget/core/init/locale/locale_manager.dart';
import 'package:vbt_camp_widget/product/mixin/model/user_manager.dart';

import 'feature/dioService/view/album_view.dart';
import 'feature/login/view/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  runApp(MultiProvider(
    providers: [Provider.value(value: UserManager())],
    child: MyApp(),
  ));
}

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
        home: LoginView());
  }
}
