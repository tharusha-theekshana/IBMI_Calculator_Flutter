import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibmi_calculator/utills/calculator.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  test(
      'Give height and weight When calculateBMI function invoked Then correct BMI returned',
      () {
    //Arrange
    const int height = 70;
    const int weight = 160;

    //Act
    double bmi = calculateBMI(height, weight);

    //Assert
    expect(bmi, 19.865);
  });

  test('Give url  When calculateBMI function invoked Then correct BMI returned',
      () async {
    //Arrange
    final _dioMock = DioMock();
    when(() => _dioMock.get("")).thenAnswer((_) => Future.value(Response(
          requestOptions: RequestOptions(path: ""),
          data: jsonEncode(
            {
              "Sergio Ramos": [72, 165]
            },
          ),
        )));

    //Act
        var _result = await calculateBMIAsync(_dioMock);

    //Assert
        expect(_result, 22.3);
  });
}
