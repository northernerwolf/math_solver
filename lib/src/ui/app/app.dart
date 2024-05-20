import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_solver_app/src/core/app_constant.dart';
import 'package:math_solver_app/src/core/app_routes.dart';
import 'package:math_solver_app/src/core/app_theme.dart';
import 'package:math_solver_app/src/ui/app/theme_provider.dart';
import 'package:provider/provider.dart';

class MyAppTutor extends StatelessWidget {
  final String fontFamily = "Montserrat";

  MyAppTutor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider provider, child) {
      return MaterialApp(
        title: 'Math Matrix',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        themeMode: provider.themeMode,
        initialRoute: KeyUtil.splash,
        routes: appRoutes,
        // home: InitialScreen(),
      );
    });
  }
}
