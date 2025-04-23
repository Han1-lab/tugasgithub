import 'package:flutter/material.dart';

class TemperatureProvider with ChangeNotifier {
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';
  String result = '';

  void setFromUnit(String unit) {
    fromUnit = unit;
    result = '';
    notifyListeners();
  }

  void setToUnit(String unit) {
    toUnit = unit;
    result = '';
    notifyListeners();
  }

  void convert(String input) {
    double value = double.tryParse(input) ?? 0;
    double celsius;

    switch (fromUnit) {
      case 'Fahrenheit':
        celsius = (value - 32) * 5 / 9;
        break;
      case 'Kelvin':
        celsius = value - 273.15;
        break;
      case 'Reamur':
        celsius = value * 5 / 4;
        break;
      default:
        celsius = value;
    }

    double converted;
    switch (toUnit) {
      case 'Fahrenheit':
        converted = (celsius * 9 / 5) + 32;
        break;
      case 'Kelvin':
        converted = celsius + 273.15;
        break;
      case 'Reamur':
        converted = celsius * 4 / 5;
        break;
      default:
        converted = celsius;
    }

    result = '$value °$fromUnit = ${converted.toStringAsFixed(2)} °$toUnit';
    notifyListeners();
  }
}
