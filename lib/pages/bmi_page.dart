import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ibmi_calculator/widgets/info_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utills/calculator.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  late double deviceWidth, deviceHeight;
  int age = 25;
  int weight = 150;
  int height = 60;
  int gender = 0;
  late String status;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageScaffold(
          child: SafeArea(
        child: Container(
          child: Center(
              child: Container(
            width: deviceWidth,
            height: deviceHeight * 0.90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ageSelectContainer(), weightSelectContainer()],
                ),
                heightSelectContainer(),
                genderSelectWidget(),
                calculateButton()
              ],
            ),
          )),
        ),
      ));
    } else {
      return Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
                child: Container(
              width: deviceWidth,
              height: deviceHeight * 0.90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [ageSelectContainer(), weightSelectContainer()],
                  ),
                  heightSelectContainer(),
                  genderSelectWidget(),
                  calculateButton()
                ],
              ),
            )),
          ),
        ),
      );
    }
  }

  Widget ageSelectContainer() {
    return InfoCard(
      width: deviceWidth * 0.45,
      height: deviceHeight * 0.20,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Age yr",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Text(
            age.toString(),
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: const Key('age_minus'),
                  onPressed: () {
                    setState(() {
                      age--;
                    });
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: const Key('age_plus'),
                  onPressed: () {
                    setState(() {
                      age++;
                    });
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget weightSelectContainer() {
    return InfoCard(
      width: deviceWidth * 0.45,
      height: deviceHeight * 0.20,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Weight lbs",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Text(
            weight.toString(),
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: const Key("weight_minus"),
                  onPressed: () {
                    setState(() {
                      weight--;
                    });
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  key: const Key("weight_plus"),
                  onPressed: () {
                    setState(() {
                      weight++;
                    });
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget heightSelectContainer() {
    return InfoCard(
      width: deviceWidth * 0.90,
      height: deviceHeight * 0.18,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Height in",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Text(
            height.toString(),
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
          ),
          SizedBox(
              width: deviceWidth * 0.80,
              child: defaultTargetPlatform == TargetPlatform.iOS
                  ? CupertinoSlider(
                      min: 12,
                      max: 108,
                      divisions: 96,
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      })
                  : Slider(
                      min: 12,
                      value: height.toDouble(),
                      max: 108,
                      divisions: 96,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      })),
        ],
      ),
    );
  }

  Widget genderSelectWidget() {
    return InfoCard(
      width: deviceWidth * 0.90,
      height: deviceHeight * 0.15,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Gender",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          CupertinoSlidingSegmentedControl(
            groupValue: gender,
            children: const {
              0: Text("Male"),
              1: Text("Female"),
            },
            onValueChanged: (value) {
              setState(() {
                gender = value as int;
              });
            },
          )
        ],
      ),
    );
  }

  Widget calculateButton() {
    return Container(
      height: deviceHeight * 0.06,
      width: deviceWidth * 0.59,
      child: CupertinoButton.filled(
        key: Key('calculate_button'),
        child: const Text(
          "Calculate BMI",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (height > 0 && weight > 0 && age > 0) {
            double bmi = calculateBMI(height, weight);
            showResultDialog(bmi);
          }
        },
      ),
    );
  }

  void showResultDialog(double bmi) {
    if (bmi < 18.5) {
      status = "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      status = "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      status = "Overweight";
    } else {
      status = "Obese";
    }

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoAlertDialog(
                title: Text(status),
                content: Text(bmi.toStringAsFixed(2)),
                actions: [
                  CupertinoDialogAction(
                    child: const Text("Ok"),
                    onPressed: () {
                      saveResult(bmi.toString(), status);
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            : AlertDialog(
                title: Text(status),
                content: Text(bmi.toStringAsFixed(2)),
                actions: <Widget>[
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      saveResult(bmi.toString(), status);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
      },
    );
  }

  void saveResult(String bmi, String status) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString("bmi_date", DateTime.now().toString());
    await pref.setString("bmi", bmi.toString());
    await pref.setString("status", status.toString());
    print(pref);
  }
}
