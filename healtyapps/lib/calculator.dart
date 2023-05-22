import 'package:flutter/material.dart';
import 'navbar.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
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
      color: Color(0xffABA6E8),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xfffffffff),
          body: Container(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Nama',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _name = value;
                              });
                            },
                          ),
                          SizedBox(height: 8.0),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Berat Badan (kg)',
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                _weight = double.tryParse(value) ?? 0.0;
                              });
                            },
                          ),
                          SizedBox(height: 8.0),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Tinggi Badan (cm)',
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                _height = double.tryParse(value) ?? 0.0;
                              });
                            },
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            margin: EdgeInsets.only(bottom: 20, top: 50),
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xff7F78D2)),
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
                                      color: Color(0xfffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text('Nama: $_name'),
                          SizedBox(height: 8.0),
                          Text('Berat Badan: $_weight kg'),
                          SizedBox(height: 8.0),
                          Text('Tinggi Badan: $_height cm'),
                          SizedBox(height: 8.0),
                          Text('BMI: ${_bmi.toStringAsFixed(2)}'),
                          SizedBox(height: 8.0),
                          Text('Status Berat Badan: $_status'),
                          SizedBox(height: 8.0),
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
          bottomNavigationBar: BottomNavbar(),
        ),
      ),
    );
  }
}
