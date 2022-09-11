import 'package:another_flushbar/flushbar.dart';
import 'package:app_pertemuan2/bmi_result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

enum Gender {
  male,
  female,
}

const notSelectedColor = Color.fromARGB(255, 61, 61, 61);
const SelectedColor = Colors.green;
const contentColor = Color.fromARGB(255, 62, 114, 19);
const kInactiveCardColour = Color.fromARGB(255, 40, 25, 17);
const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const kNumberTextStyle = TextStyle(
  fontSize: 60.0,
  fontWeight: FontWeight.w900,
  color: Colors.green,
);

class CardSelect extends StatelessWidget {
  CardSelect({required this.colourSelect, required this.childes});

  final Color colourSelect;
  final Widget? childes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: childes,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colourSelect,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      hoverColor: notSelectedColor,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 38.0,
        height: 38.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Padding(padding: EdgeInsets.all(5)),
      ],
    );
  }
}

class _BmiScreenState extends State<BmiScreen> {
  Gender? statusGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  int heightSize = 60;
  String categories = '';
  String genderText = "Select";

  double _bmi = 0.0;

  getReset() {
    height = 180;
    weight = 60;
    age = 20;
    categories = '';
    genderText = "Select";
  }

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getCategoryBMI() {
    if (_bmi >= 27) {
      return 'Your BMI weight range 18.5 - 25.0';
    } else if (_bmi > 25.1) {
      return 'Your BMI weight range 18.5 - 25.0';
    } else if (_bmi > 18.5) {
      return 'Healthy weight range 18.5 - 25.0';
    } else if (_bmi > 17.0) {
      return 'Your BMI weight range 17.0 - 18.4';
    } else {
      return 'BMI range 17.0';
    }
  }

  MaterialColor getColorInfo() {
    if (_bmi >= 25) {
      return Colors.red;
    } else if (_bmi >= 18.5) {
      return Colors.green;
    } else {
      return Colors.amber;
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Head title
                Container(
                  height: 20,
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Calculate Your Body Mass Index",
                    style: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ),

                //Isi
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: contentColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'I\'Am',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  genderText,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: SelectedColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CardSelect(
                            colourSelect: statusGender == Gender.male
                                ? SelectedColor
                                : notSelectedColor,
                            childes: InkWell(
                              onTap: () {
                                // debugPrint('Card tapped.');
                                setState(() {
                                  statusGender = Gender.male;
                                  genderText = 'Male';
                                });
                              },
                              child: IconContent(
                                icon: Icons.male,
                                label: 'Male',
                              ),
                            ),
                          ),
                          CardSelect(
                            colourSelect: statusGender == Gender.female
                                ? SelectedColor
                                : notSelectedColor,
                            childes: InkWell(
                              onTap: () {
                                // debugPrint('Card tapped.');
                                setState(() {
                                  statusGender = Gender.female;
                                  genderText = 'Female';
                                });
                              },
                              child: IconContent(
                                icon: Icons.female,
                                label: 'Female',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: contentColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Height',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  height.toString(),
                                  style: TextStyle(
                                    color: SelectedColor,
                                    fontSize: heightSize.toDouble(),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'CM',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Colors.white,
                              activeTrackColor: Colors.green,
                              thumbColor: Colors.white,
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: contentColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                        icon: Icons.remove,
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        }),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundIconButton(
                                      icon: Icons.add,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            width: 1,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.green,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Your Age',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  age.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                        icon: Icons.remove,
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                          });
                                        }),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundIconButton(
                                      icon: Icons.add,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: contentColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Your BMI",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      calculateBMI(),
                                      style: TextStyle(
                                        fontSize: 55,
                                        color: getColorInfo(),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      getResult(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: getColorInfo(),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.info_rounded,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
                                        await Flushbar(
                                          title: 'Process Detail',
                                          message: 'Calculating..',
                                          duration: Duration(seconds: 1),
                                        ).show(context);
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => BmiResult(
                                            bmiResult: calculateBMI(),
                                            resultText: getResult(),
                                            interpretation: getInterpretation(),
                                            categories: getCategoryBMI(),
                                          ),
                                        )
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.replay,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    await Flushbar(
                                      message: 'Reseting..',
                                      duration: Duration(seconds: 1),
                                    ).show(context);
                                    setState(() {
                                      getReset();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //Button Menu
              ],
            ),
          ],
        ),
      ),
    );
  }
}
