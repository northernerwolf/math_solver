import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:math_solver_app/src/core/color_scheme.dart';

class IntegralCalculatorScreen extends StatefulWidget {
  @override
  _IntegralCalculatorScreenState createState() =>
      _IntegralCalculatorScreenState();
}

class _IntegralCalculatorScreenState extends State<IntegralCalculatorScreen> {
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
                            'Inverse Trigonometric',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    controller: _functionController,
                    decoration: InputDecoration(
                      labelText: 'Function (e.g., asin(x), atan(x))',
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
      case 'asin(x)':
        return '1. Let f(x) = asin(x)\n'
            '2. Integral of asin(x) is x * asin(x) + sqrt(1 - x^2) + C\n'
            '3. Substitute x = $x';
      case 'acos(x)':
        return '1. Let f(x) = acos(x)\n'
            '2. Integral of acos(x) is x * acos(x) - sqrt(1 - x^2) + C\n'
            '3. Substitute x = $x';
      case 'atan(x)':
        return '1. Let f(x) = atan(x)\n'
            '2. Integral of atan(x) is x * atan(x) - 0.5 * ln(1 + x^2) + C\n'
            '3. Substitute x = $x';
      case 'asinh(x)':
        return '1. Let f(x) = asinh(x)\n'
            '2. Integral of asinh(x) is x * asinh(x) - sqrt(x^2 + 1) + C\n'
            '3. Substitute x = $x';
      case 'acosh(x)':
        return '1. Let f(x) = acosh(x)\n'
            '2. Integral of acosh(x) is x * acosh(x) - sqrt(x^2 - 1) + C\n'
            '3. Substitute x = $x';
      case 'atanh(x)':
        return '1. Let f(x) = atanh(x)\n'
            '2. Integral of atanh(x) is x * atanh(x) + 0.5 * ln(1 - x^2) + C\n'
            '3. Substitute x = $x';
      default:
        return 'Function not recognized';
    }
  }

  String _integrate(String function, double x) {
    switch (function) {
      case 'asin(x)':
        return '${x * math.asin(x) + math.sqrt(1 - x * x)} + C';
      case 'acos(x)':
        return '${x * math.acos(x) - math.sqrt(1 - x * x)} + C';
      case 'atan(x)':
        return '${x * math.atan(x) - 0.5 * math.log(1 + x * x)} + C';
      case 'asinh(x)':
        return '${x * _asinh(x) - math.sqrt(x * x + 1)} + C';
      case 'acosh(x)':
        return '${x * _acosh(x) - math.sqrt(x * x - 1)} + C';
      case 'atanh(x)':
        return '${x * _atanh(x) + 0.5 * math.log(1 - x * x)} + C';
      // Add more cases for other inverse trigonometric functions
      default:
        return 'Function not recognized';
    }
  }

  double _asinh(double x) {
    return math.log(x + math.sqrt(x * x + 1));
  }

  double _acosh(double x) {
    return math.log(x + math.sqrt(x * x - 1));
  }

  double _atanh(double x) {
    return 0.5 * math.log((1 + x) / (1 - x));
  }
}
