import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';

class WaterRecordScreen extends StatefulWidget {
  @override
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

  Future<Null> _showTimePicker(BuildContext context) async {
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
        accent: Color(0xff7F78D2),
        backButton: false,
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total water intake: ${_totalWaterIntake ~/ 240} glasses',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showTimePicker(context),
              child: Text('Add 1 glass of water'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _resetWaterIntake();
              },
              child: Text('Reset'),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                _getWaterIntakeStatus(),
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 96, 96, 96)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
