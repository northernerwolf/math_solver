import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'dart:math' as math;

class PretiIntegralCalculatorScreen extends StatefulWidget {
  @override
  _IntegralCalculatorScreenState createState() =>
      _IntegralCalculatorScreenState();
}

class _IntegralCalculatorScreenState
    extends State<PretiIntegralCalculatorScreen> {
  final TextEditingController _functionController = TextEditingController();
  final TextEditingController _xController = TextEditingController();
  double _result = 0.0;
  String _steps = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integral Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _functionController,
              decoration: InputDecoration(
                  labelText: 'Function (e.g., x^2, 1/x, e^x, sin(x), cos(x))'),
            ),
            TextField(
              controller: _xController,
              decoration: InputDecoration(labelText: 'Enter value of x'),
              keyboardType: TextInputType.number,
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Math.tex(
                  _steps,
                  mathStyle: MathStyle.display,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 24),
            ),
          ],
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
        return '1. Let f(x) = x^2\n '
            '2. Integral of x^2 is ${(x * x * x / 3).toStringAsFixed(2)} + C\n'
            '3. Substitute x = $x';
      case '1/x':
        return '1. Let f(x) = 1/x\n'
            '2. Integral of 1/x is ${x > 0 ? math.log(x).toStringAsFixed(2) : 'NaN'} + C (for x ≠ 0)\n'
            '3. Substitute x = $x';
      case 'e^x':
        return '1. Let f(x) = e^x\n'
            '2. Integral of e^x is ${math.exp(x).toStringAsFixed(2)} + C\n'
            '3. Substitute x = $x';
      case 'sin(x)':
        return '1. Let f(x) = sin(x)\n'
            '2. Integral of sin(x) is ${(-math.cos(x)).toStringAsFixed(2)} + C\n'
            '3. Substitute x = $x';
      case 'cos(x)':
        return '1. Let f(x) = cos(x)\n'
            '2. Integral of cos(x) is ${(math.sin(x)).toStringAsFixed(2)} + C\n'
            '3. Substitute x = $x';
      // Add more cases for other basic functions
      default:
        return '';
    }
  }

  // String _generateSteps(String function, double x) {
  // switch (function) {
  //   case 'x^2':
  //     return '1. Let $f(x) = x^2$ \n'
  //         '2. Integral of $x^2$ is $\\frac{x^3}{3} + C$ \n'
  //         '3. Substitute $x = $' + x.toString();
  //   case '1/x':
  //     return '1. Let $f(x) = \\frac{1}{x}$ \n'
  //         '2. Integral of $\\frac{1}{x}$ is $\\ln |x| + C$ (for $x \\neq 0$) \n'
  //         '3. Substitute $x = $' + x.toString();
  //   case 'e^x':
  //     return '1. Let $f(x) = e^x$ \n'
  //         '2. Integral of $e^x$ is $e^x + C$ \n'
  //         '3. Substitute $x = $' + x.toString();
  //   case 'sin(x)':
  //     return '1. Let $f(x) = \\sin(x)$ \n'
  //         '2. Integral of $\\sin(x)$ is $-\\cos(x) + C$ \n'
  //         '3. Substitute $x = $' + x.toString();
  //   case 'cos(x)':
  //     return '1. Let $f(x) = \\cos(x)$ \n'
  //         '2. Integral of $\\cos(x)$ is $\\sin(x) + C$ \n'
  //         '3. Substitute $x = $' + x.toString();
  //   // Add more cases for other basic functions
  //   default:
  //     return '';
  // }
}
