import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ibmi_calculator/widgets/info_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  late double deviceWidth, deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return CupertinoPageScaffold(child: dataCard());
  }

  Widget dataCard() {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final pref = snapshot.data as SharedPreferences;
          final date = pref.getString("bmi_date");
          final status = pref.getString("status");
          final bmi = pref.getString("bmi");
          return Center(
            child: InfoCard(
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  statusText(status!),
                  dateText(date!),
                  bmiText(bmi!)
                ],
              ),
            ),
          );
        } else {
          return  defaultTargetPlatform == TargetPlatform.iOS ? const Center(
            child: CupertinoActivityIndicator(
              color: Colors.blue,
            ),
          ) : const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
      },
    );
  }

  Widget statusText(String status) {
    return Text(status.toString(),
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500));
  }

  Widget dateText(String date) {
    DateTime parseDate = DateTime.parse(date);
    return Text(
      '${parseDate.day} / ${parseDate.month} / ${parseDate.year}',
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
    );
  }

  Widget bmiText(String bmi) {
    return Text(
      double.parse(bmi).toStringAsFixed(2),
      style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
    );
  }


}
