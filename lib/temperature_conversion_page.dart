import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temperature_provider.dart';

class TemperatureConversionPage extends StatelessWidget {
  const TemperatureConversionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemperatureProvider>(context);
    final tempController = TextEditingController();

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
                  value: provider.fromUnit,
                  onChanged: (value) {
                    if (value != null) {
                      provider.setFromUnit(value);
                    }
                  },
                  items: ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur']
                      .map((unit) => DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          ))
                      .toList(),
                ),
                DropdownButton<String>(
                  value: provider.toUnit,
                  onChanged: (value) {
                    if (value != null) {
                      provider.setToUnit(value);
                    }
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
              controller: tempController,
              decoration: InputDecoration(labelText: 'Masukkan Suhu'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                provider.convert(tempController.text);
              },
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(provider.result, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
