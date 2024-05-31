import 'package:flutter/material.dart';
import 'package:fraction/fraction.dart';
import 'package:math_solver_app/src/core/color_scheme.dart';

class FractionCalculatorScreen extends StatefulWidget {
  @override
  _FractionCalculatorScreenState createState() =>
      _FractionCalculatorScreenState();
}

class _FractionCalculatorScreenState extends State<FractionCalculatorScreen> {
  final TextEditingController _numerator1Controller = TextEditingController();
  final TextEditingController _denominator1Controller = TextEditingController();
  final TextEditingController _numerator2Controller = TextEditingController();
  final TextEditingController _denominator2Controller = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final TextEditingController _stepsController = TextEditingController();

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            'Fraction Calculator',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFractionInputFields(_numerator1Controller,
                          _denominator1Controller, 'Fraction 1'),
                      SizedBox(height: 20),
                      _buildFractionInputFields(_numerator2Controller,
                          _denominator2Controller, 'Fraction 2'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOperationButton('+'),
                      _buildOperationButton('-'),
                      _buildOperationButton('*'),
                      _buildOperationButton('/'),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _resultController,
                    readOnly: true,
                    decoration: InputDecoration(labelText: 'Result'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _stepsController,
                    readOnly: true,
                    maxLines: 5,
                    decoration: InputDecoration(labelText: 'Solution Steps'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFractionInputFields(TextEditingController numeratorController,
      TextEditingController denominatorController, String label) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 120,
            child: TextField(
              controller: numeratorController,
              decoration: InputDecoration(
                labelText: '$label Numerator',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 120,
            child: TextField(
              controller: denominatorController,
              decoration: InputDecoration(
                labelText: '$label Denominator',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOperationButton(String operation) {
    return ElevatedButton(
      onPressed: () {
        _calculate(operation);
      },
      child: Text(operation),
    );
  }

  void _calculate(String operation) {
    Fraction fraction1 = Fraction(int.tryParse(_numerator1Controller.text) ?? 0,
        int.tryParse(_denominator1Controller.text) ?? 1);
    Fraction fraction2 = Fraction(int.tryParse(_numerator2Controller.text) ?? 0,
        int.tryParse(_denominator2Controller.text) ?? 1);

    Fraction result = Fraction(0, 1);
    String steps = '';

    switch (operation) {
      case '+':
        result = fraction1 + fraction2;
        steps = '$fraction1 + $fraction2 = $result';
        break;
      case '-':
        result = fraction1 - fraction2;
        steps = '$fraction1 - $fraction2 = $result';
        break;
      case '*':
        result = fraction1 * fraction2;
        steps = '$fraction1 * $fraction2 = $result';
        break;
      case '/':
        if (fraction2 != Fraction(0, 1)) {
          result = fraction1 / fraction2;
          steps = '$fraction1 / $fraction2 = $result';
        } else {
          _resultController.text = 'Cannot divide by zero';
          return;
        }
        break;
      default:
        break;
    }

    setState(() {
      _resultController.text = result.toString();
      _stepsController.text = steps;
    });
  }
}
