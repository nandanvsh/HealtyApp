import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _name = '';
  double _height = 0.0;
  double _weight = 0.0;
  double _bmi = 0.0;
  String _status = '';

  void _calculateBMI() {
    ///Indeks Massa Tubuh (atau BMI) dihitung sebagai berat badan Anda (dalam kilogram)
    ///dibagi dengan kuadrat tinggi badan Anda (dalam meter) atau BMI = Kg/M2.
    if (_height > 0 && _weight > 0) {
      _bmi = _weight / ((_height / 100) * (_height / 100));
      if (_bmi >= 18.5 && _bmi <= 25) {
        _status = 'Normal';
      } else if (_bmi > 25 && _bmi <= 40) {
        _status = 'Berlebih';
      } else if (_bmi < 18.5) {
        _status = 'Kurang';
      } else {
        _status = 'Butuh penanganan';
      }
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
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Nama',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _name = value;
                            });
                          },
                        ),
                        const SizedBox(height: 8.0),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Berat Badan (kg)',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _weight = double.tryParse(value) ?? 0.0;
                            });
                          },
                        ),
                        const SizedBox(height: 8.0),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Tinggi Badan (cm)',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _height = double.tryParse(value) ?? 0.0;
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20, top: 50),
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
                                  _calculateBMI();
                                });
                              },
                              child: const Center(
                                child: Text(
                                  "Hitung BMI",
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
                        Text('Nama: $_name'),
                        const SizedBox(height: 8.0),
                        Text('Berat Badan: $_weight kg'),
                        const SizedBox(height: 8.0),
                        Text('Tinggi Badan: $_height cm'),
                        const SizedBox(height: 8.0),
                        Text('BMI: ${_bmi.toStringAsFixed(2)}'),
                        const SizedBox(height: 8.0),
                        Text('Status Berat Badan: $_status'),
                        const SizedBox(height: 8.0),
                        Text(
                            'Berat Badan Ideal: ${((_height - 100) * 0.9).toStringAsFixed(2)} kg'),
                      ],
                    ),
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
