import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';

double calculateBMI(int height,int weight){
  return 703 * (weight/ pow(height, 2));
}

Future<double> calculateBMIAsync(Dio _dio) async {
  var _result = await _dio.get("");
  var _data = jsonDecode(_result.data) as Map;
  var _bmi = calculateBMI(_data[""][0], _data[""][1]);
  return _bmi;
}

