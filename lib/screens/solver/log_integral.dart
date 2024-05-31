import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:math_solver_app/src/core/color_scheme.dart';

class LogIntegralCalculatorScreen extends StatefulWidget {
  @override
  _LogIntegralCalculatorScreenState createState() =>
      _LogIntegralCalculatorScreenState();
}

class _LogIntegralCalculatorScreenState
    extends State<LogIntegralCalculatorScreen> {
  final TextEditingController _functionController = TextEditingController();
  final TextEditingController _xController = TextEditingController();
  String _steps = '';
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          child: Card(
                            color: Theme.of(context).colorScheme.crossColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: InkWell(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SizedBox(
                                height: 38,
                                width: 38,
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color:
                                      Theme.of(context).colorScheme.baseColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Special Functions',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    controller: _functionController,
                    decoration: InputDecoration(
                      labelText: 'Function (e.g., log(x), ln(x))',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _xController,
                    decoration: InputDecoration(
                      labelText: 'Enter value of x',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculateIntegral,
                    child: Text('Calculate Integral'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Steps:\n$_steps',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Result: $_result',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _calculateIntegral() {
    String function = _functionController.text;
    double x = double.parse(_xController.text);

    setState(() {
      _steps = _generateSteps(function, x);
      _result = _integrate(function, x);
    });
  }

  String _generateSteps(String function, double x) {
    switch (function) {
      case 'ln(x)':
        return '1. Let f(x) = ln(x)\n'
            '2. Integral of ln(x) is x * ln(x) - x + C\n'
            '3. Substitute x = $x';
      case 'log_a(x)':
        return '1. Let f(x) = log_a(x)\n'
            '2. Integral of log_a(x) is x / ln(a) * ln(x) - x / ln(a) + C\n'
            '3. Substitute x = $x';
      default:
        return 'Function not recognized';
    }
  }

  String _integrate(String function, double x) {
    switch (function) {
      case 'ln(x)':
        return '${x * math.log(x) - x} + C';
      case 'log_a(x)':
        double a = 10; // Assuming base 10 logarithm
        return '${x / math.log(a) * math.log(x) - x / math.log(a)} + C';
      default:
        return 'Function not recognized';
    }
  }
}
