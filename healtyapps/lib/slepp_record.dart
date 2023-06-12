import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

class SleepCalculator extends StatefulWidget {
  const SleepCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SleepCalculatorState createState() => _SleepCalculatorState();
}

class _SleepCalculatorState extends State<SleepCalculator> {
  TimeOfDay _bedTime = const TimeOfDay(hour: 22, minute: 0);
  TimeOfDay _wakeUpTime = const TimeOfDay(hour: 6, minute: 0);
  int _sleepDuration = 0;

  Future<void> _selectBedTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _bedTime,
    );
    if (picked != null && picked != _bedTime) {
      setState(() {
        _bedTime = picked;
      });
    }
  }

  Future<void> _selectWakeUpTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _wakeUpTime,
    );
    if (picked != null && picked != _wakeUpTime) {
      setState(() {
        _wakeUpTime = picked;
      });
    }
  }

  void _calculateSleepDuration() {
    final bedTimeInMinutes = _bedTime.hour * 60 + _bedTime.minute;
    final wakeUpTimeInMinutes = _wakeUpTime.hour * 60 + _wakeUpTime.minute;
    if (bedTimeInMinutes < wakeUpTimeInMinutes) {
      _sleepDuration = wakeUpTimeInMinutes - bedTimeInMinutes;
    } else {
      _sleepDuration = 24 * 60 - bedTimeInMinutes + wakeUpTimeInMinutes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffABA6E8),
      child: SafeArea(
        child: Scaffold(
          // ignore: use_full_hex_values_for_flutter_colors
          backgroundColor: const Color(0xfffffffff),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(66.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Bed Time:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ElevatedButton(
                    onPressed: () => _selectBedTime(context),
                    child: Text(_bedTime.format(context)),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Wake Up Time:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ElevatedButton(
                    onPressed: () => _selectWakeUpTime(context),
                    child: Text(_wakeUpTime.format(context)),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, top: 20),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xff7F78D2)),
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _calculateSleepDuration();
                          });
                        },
                        child: const Center(
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              // ignore: use_full_hex_values_for_flutter_colors
                              color: Color(0xfffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Sleep Duration:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '${_sleepDuration ~/ 60} hours ${_sleepDuration % 60} minutes',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
