import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi_calculator/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end app test', () {
    var _weightIncrementButton = find.byKey(Key('weight_plus'));
    var _ageIncrementButton = find.byKey(Key('age_plus'));
    var _bmiCalculateButton = find.byType(CupertinoButton);

    testWidgets('Given app is ran when height,age data input and calculate after BMI button pressed',
        (tester) async {
          app.main();

          await tester.pumpAndSettle();
          await tester.tap(_weightIncrementButton);
          await tester.pumpAndSettle();
          await tester.tap(_ageIncrementButton);
          await tester.pumpAndSettle();
          await tester.tap(_bmiCalculateButton);
          await tester.pumpAndSettle();

          var _result = find.text('Overweight');
          await Future.delayed(Duration(
            seconds: 1
          ));

          expect(_result, findsOneWidget);
        }
    );
  });
}
