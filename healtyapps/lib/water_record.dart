import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';

class WaterRecordScreen extends StatefulWidget {
  const WaterRecordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WaterRecordScreenState createState() => _WaterRecordScreenState();
}

class _WaterRecordScreenState extends State<WaterRecordScreen> {
  int _totalWaterIntake = 0;

  void _addWaterIntake(int amount) {
    setState(() {
      _totalWaterIntake += amount;
    });
  }

  void _resetWaterIntake() {
    setState(() {
      _totalWaterIntake = 0;
    });
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      _addWaterIntake(240);
    }
  }

  String _getWaterIntakeStatus() {
    if (_totalWaterIntake >= 8 * 240) {
      return 'You have reached your daily goal of 8 glasses of water!';
    } else {
      return 'You still need to drink ${8 * 240 - _totalWaterIntake} ml more to reach your daily goal of 8 glasses of water.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        accent: const Color(0xff7F78D2),
        backButton: false,
        // ignore: avoid_print
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total water intake: ${_totalWaterIntake ~/ 240} glasses',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showTimePicker(context),
              child: const Text('Add 1 glass of water'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _resetWaterIntake();
              },
              child: const Text('Reset'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                _getWaterIntakeStatus(),
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 96, 96, 96)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
