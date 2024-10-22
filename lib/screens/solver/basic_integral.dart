import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:math_solver_app/src/core/color_scheme.dart';

class BasicIntegralCalculatorScreen extends StatefulWidget {
  @override
  _IntegralCalculatorScreenState createState() =>
      _IntegralCalculatorScreenState();
}

class _IntegralCalculatorScreenState
    extends State<BasicIntegralCalculatorScreen> {
  final TextEditingController _functionController = TextEditingController();
  final TextEditingController _xController = TextEditingController();
  double _result = 0.0;
  String _steps = '';

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
                            'Basic Integral',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    controller: _functionController,
                    decoration: InputDecoration(
                      labelText:
                          'Function (e.g., x^2, 1/x, e^x, sin(x), cos(x))',
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter value of x',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculateIntegral,
                    child: Text('Calculate Integral'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Steps:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: Text(
                      _steps,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Expanded(
                      child: Math.tex(
                        _steps,
                        mathStyle: MathStyle.display,
                        textStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
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
      _result = _integrate(function, x);
      _steps = _generateSteps(function, x);
    });
  }

  double _integrate(String function, double x) {
    switch (function) {
      case 'x^2':
        return (x * x * x) / 3;
      case '1/x':
        return x > 0 ? math.log(x) : double.nan; // log is ln
      case 'e^x':
        return math.exp(x);
      case 'sin(x)':
        return -math.cos(x);
      case 'cos(x)':
        return math.sin(x);
      // Add more cases for other basic functions
      default:
        return double.nan;
    }
  }

  String _generateSteps(String function, double x) {
    switch (function) {
      case 'x^2':
        return '1. Let f(x) = x^2\n'
            '2. Integral of x^2 is (x^3) / 3 + C\n'
            '3. Substitute x = $x';
      case '1/x':
        return '1. Let f(x) = 1/x\n'
            '2. Integral of 1/x is ln|x| + C (for x ≠ 0)\n'
            '3. Substitute x = $x';
      case 'e^x':
        return '1. Let f(x) = e^x\n'
            '2. Integral of e^x is e^x + C\n'
            '3. Substitute x = $x';
      case 'sin(x)':
        return '1. Let f(x) = sin(x)\n'
            '2. Integral of sin(x) is -cos(x) + C\n'
            '3. Substitute x = $x';
      case 'cos(x)':
        return '1. Let f(x) = cos(x)\n'
            '2. Integral of cos(x) is sin(x) + C\n'
            '3. Substitute x = $x';
      // Add more cases for other basic functions
      default:
        return '';
    }
  }
}
