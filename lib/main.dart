import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   bool isDark = false;
//   MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           useMaterial3: true,
//           primarySwatch: Colors.indigo,
//           brightness: isDark ? Brightness.dark : Brightness.light),
//       home: const InitialScreen(),
//     );
//   }
// }

import 'package:flutter/foundation.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';
import 'package:math_solver_app/src/ui/app/app.dart';
import 'package:math_solver_app/src/ui/app/theme_provider.dart';
import 'package:math_solver_app/src/ui/dashboard/dashboard_provider.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    Animate.restartOnHotReload = true;
  }

  final sharedPreferences = await SharedPreferences.getInstance();

  setupServiceLocator(sharedPreferences);
  runApp(
    MultiProvider(
      providers: [
        // Provider<SharedPreferences>(create: (context) => sharedPreferences),
        ChangeNotifierProvider(
          create: (context) =>
              ThemeProvider(sharedPreferences: sharedPreferences),
        ),
        ChangeNotifierProvider<DashboardProvider>(
          create: (context) => GetIt.I.get<DashboardProvider>(),
        )
      ],
      child: MyAppTutor(),
    ),
  );
}

setupServiceLocator(SharedPreferences sharedPreferences) {
  GetIt.I.registerSingleton<DashboardProvider>(
      DashboardProvider(preferences: sharedPreferences));
}
