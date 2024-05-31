import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:math_solver_app/src/core/color_scheme.dart';

class QuadraticCalculatorScreen extends StatefulWidget {
  @override
  _QuadraticCalculatorScreenState createState() =>
      _QuadraticCalculatorScreenState();
}

class _QuadraticCalculatorScreenState extends State<QuadraticCalculatorScreen> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String _steps = '';
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
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
                            'Quadratic Equation',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _aController,
                    decoration: InputDecoration(
                      labelText: 'Enter coefficient a',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _bController,
                    decoration: InputDecoration(
                      labelText: 'Enter coefficient b',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _cController,
                    decoration: InputDecoration(
                      labelText: 'Enter coefficient c',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculateQuadratic,
                    child: Text('Calculate Roots'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Steps:\n$_steps',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    child: Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Math.tex(
                          _steps,
                          mathStyle: MathStyle.display,
                          textStyle: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Result:\n$_result',
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

  void _calculateQuadratic() {
    double a = double.parse(_aController.text);
    double b = double.parse(_bController.text);
    double c = double.parse(_cController.text);

    setState(() {
      _steps = _generateSteps(a, b, c);
      _result = _solveQuadratic(a, b, c);
    });
  }

  String _generateSteps(double a, double b, double c) {
    double discriminant = b * b - 4 * a * c;
    return '1. Given equation: ${a}x^2 + ${b}x + $c = 0\n'
        '2. Calculate the discriminant: Δ = b^2 - 4ac\n'
        '   Δ = ${b}^2 - 4 * ${a} * ${c} = $discriminant\n'
        '3. Use the quadratic formula: x = (-b ± √Δ) / (2a)\n'
        '   If Δ > 0, the equation has two distinct real roots.\n'
        '   If Δ = 0, the equation has one real root.\n'
        '   If Δ < 0, the equation has two complex roots.';
  }

  String _solveQuadratic(double a, double b, double c) {
    double discriminant = b * b - 4 * a * c;

    if (discriminant > 0) {
      double root1 = (-b + math.sqrt(discriminant)) / (2 * a);
      double root2 = (-b - math.sqrt(discriminant)) / (2 * a);
      return 'Roots are real and distinct: x1 = ${root1.toStringAsFixed(2)}, x2 = ${root2.toStringAsFixed(2)}';
    } else if (discriminant == 0) {
      double root = -b / (2 * a);
      return 'Root is real and repeated: x = ${root.toStringAsFixed(2)}';
    } else {
      double realPart = -b / (2 * a);
      double imaginaryPart = math.sqrt(-discriminant) / (2 * a);
      return 'Roots are complex: x1 = ${realPart.toStringAsFixed(2)} + ${imaginaryPart.toStringAsFixed(2)}i, x2 = ${realPart.toStringAsFixed(2)} - ${imaginaryPart.toStringAsFixed(2)}i';
    }
  }
}
