import 'package:flutter/material.dart';
import 'package:math_solver_app/src/core/color_scheme.dart';
import 'dart:math' as math;

class IntegralScreen extends StatefulWidget {
  const IntegralScreen({super.key});

  @override
  State<IntegralScreen> createState() => _IntegralScreenState();
}

class _IntegralScreenState extends State<IntegralScreen> {
  final TextEditingController _functionController = TextEditingController();
  final TextEditingController _xController = TextEditingController();
  double _result = 0.0;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          key: formKey,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(children: [
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
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                            height: 38,
                            width: 38,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Theme.of(context).colorScheme.baseColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])),
              TextField(
                controller: _functionController,
                decoration: InputDecoration(labelText: 'Function f(x)'),
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
                'Result: $_result',
                style: TextStyle(fontSize: 24),
              ),
            ],
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
    });
  }

  double _integrate(String function, double x) {
    switch (function) {
      case 'x^2':
        return (x * x * x) / 3;
      case '1/x':
        return x > 0 ? log(x) : double.nan; // log is ln
      case 'e^x':
        return exp(x);
      case 'sin(x)':
        return -cos(x);
      case 'cos(x)':
        return sin(x);
      // Add more cases for other basic functions
      default:
        return double.nan;
    }
  }

  double log(double x) => math.log(x); // Natural logarithm
  double exp(double x) => math.exp(x); // Exponential
  double sin(double x) => math.sin(x); // Sine
  double cos(double x) => math.cos(x); // Cosine
}
