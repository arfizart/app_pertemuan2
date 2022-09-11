import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BmiResult extends StatelessWidget {
  BmiResult(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText,
      required this.categories});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String categories;

  MaterialColor colorInfoText() {
    if (resultText == 'Overweight') {
      return Colors.red;
    } else if (resultText == 'Normal') {
      return Colors.green;
    } else {
      return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Your BMI",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  resultText.toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    color: colorInfoText(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  bmiResult,
                  style: TextStyle(
                    fontSize: 75,
                    color: colorInfoText(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  categories,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorInfoText(),
              ),
              child: Text(
                interpretation,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pop(context);
              },
              label: const Text("Re-Calculate"),
              tooltip: 'Back',
              icon: const Icon(Icons.home_filled),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
