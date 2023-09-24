import 'package:flutter/material.dart';
import 'package:math_solver_app/screens/initial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isDark = false;
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.indigo,
          brightness: isDark ? Brightness.dark : Brightness.light),
      home: const InitialScreen(),
    );
  }
}
