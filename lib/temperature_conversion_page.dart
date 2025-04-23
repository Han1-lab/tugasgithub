import 'package:flutter/material.dart';

class TemperatureConversionPage extends StatefulWidget {
  const TemperatureConversionPage({super.key});

  @override
  _TemperatureConversionPageState createState() => _TemperatureConversionPageState();
}

class _TemperatureConversionPageState extends State<TemperatureConversionPage> {
  final TextEditingController temperatureController = TextEditingController();
  String result = '';
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';

  double convertTemperature(double value, String from, String to) {
    double celsius;

    switch (from) {
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

    switch (to) {
      case 'Fahrenheit':
        return (celsius * 9 / 5) + 32;
      case 'Kelvin':
        return celsius + 273.15;
      case 'Reamur':
        return celsius * 4 / 5;
      default:
        return celsius;
    }
  }

  void performConversion() {
    double temperature = double.parse(temperatureController.text);
    double convertedTemperature = convertTemperature(temperature, fromUnit, toUnit);
    
    setState(() {
      result = '$temperature °$fromUnit = $convertedTemperature °$toUnit';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konversi Suhu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: fromUnit,
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                      temperatureController.clear();
                      result = '';
                    });
                  },
                  items: ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur']
                      .map((unit) => DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          ))
                      .toList(),
                ),
                DropdownButton<String>(
                  value: toUnit,
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                      temperatureController.clear();
                      result = '';
                    });
                  },
                  items: ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur']
                      .map((unit) => DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          ))
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: temperatureController,
              decoration: InputDecoration(labelText: 'Masukkan Suhu'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: performConversion,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}