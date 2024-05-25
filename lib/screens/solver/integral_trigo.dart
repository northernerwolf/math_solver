import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      appBar: AppBar(
        title: Text('Integral Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _functionController,
              decoration: InputDecoration(
                  labelText: 'Function (e.g., asin(x), atan(x))'),
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
              'Steps:\n$_steps',
              style: TextStyle(fontSize: 18),
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
