import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isDark = false;
  bool hasError = false;

  double a = 0,
      b = 0,
      c = 0,
      discr = 0,
      root1 = 0,
      root2 = 0,
      res = 0,
      real = 0,
      imag = 0;

  final formKey = GlobalKey<FormState>();
  TextEditingController a_value = TextEditingController(text: '');
  TextEditingController b_value = TextEditingController(text: '');
  TextEditingController c_value = TextEditingController(text: '');

  String aText = "a";
  String bText = "+b";
  String cText = "+c";

  doGeneralQuadraticFormula() {
    try {
      setState(() {
        hasError = false;
        a = double.parse(a_value.text);
        b = double.parse(b_value.text);
        c = double.parse(c_value.text);
        discr = b * b - 4 * a * c;
        real = -b / (2 * a);
        imag = sqrt(-discr) / (2 * a);

        if (discr > 0) {
          root1 = ((-1 * b) + sqrt(discr)) / (2 * a);
          root2 = ((-1 * b) - sqrt(discr)) / (2 * a);
        } else {
          root1 = real;
          root2 = imag;
        }
      });
    } catch (e) {
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              'Quadratic Equation',
            ),
            Spacer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        key: formKey,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.grey[100],
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '${aText}x²${bText}x$cText = 0',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: SizedBox(
                    height: 60,
                    width: 100,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'x²'),
                      controller: a_value,
                      onChanged: (value) {
                        setState(() {
                          aText = value;
                        });
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: SizedBox(
                    height: 60,
                    width: 100,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'x'),
                      controller: b_value,
                      onChanged: (value) {
                        setState(() {
                          bText = value;
                        });
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: SizedBox(
                    height: 60,
                    width: 100,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Constant'),
                      controller: c_value,
                      onChanged: (value) {
                        setState(() {
                          cText = value;
                        });
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Visibility(
              visible: hasError,
              child: const Text(
                "The entered equation is incorrect!",
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 247, 63, 63),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                onPressed: () {
                  if (a_value.text.isNotEmpty &&
                      b_value.text.isNotEmpty &&
                      c_value.text.isNotEmpty) {
                    doGeneralQuadraticFormula();
                  } else {
                    setState(() {
                      hasError = true;
                    });
                  }
                },
                color: Colors.indigoAccent,
                child: const Text('Solve the equation'),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'The roots of the equation:',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'x₁ = $root1',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              'x₂ = $root2',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
