import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi_calculator/pages/bmi_page.dart';

void main(){
  testWidgets('Given weightInfoCard when user click + button Then weight increment by 1', (tester) async {

    await tester.pumpWidget(
      const CupertinoApp(
        home: BMIPage(),
      )
    );

    var _weightIncreamentButtton = find.byKey(
      Key('weight_plus')
    );

    await tester.tap(_weightIncreamentButtton);
    await tester.pump();

    var _text = find.text('151');
    expect(_text, findsOneWidget);

  });
}