import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffABA6E8),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffffffffff),
            body: Center(
              child: Card(
                elevation: 50,
                shadowColor: Colors.black,
                color: const Color(0xffABA6E8),
                child: SizedBox(
                  width: 300,
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          height: 170,
                          width: 300,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/logo.png"))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Text(
                            "Aplikasi 'Healify' adalah aplikasi untuk memantau dan memelihara kesehatan seseorang. Aplikasi ini menyediakan tiga fitur utama yang sangat berguna, yaitu BMI Checker, Sleep Record, dan Running Tracker.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text("Created By : PBM B6")
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
