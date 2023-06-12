import 'package:flutter/material.dart';
import 'package:healtyapps/calculator.dart';
import 'package:healtyapps/profile.dart';
import 'package:healtyapps/slepp_record.dart';
// ignore: unused_import
import 'package:healtyapps/water_record.dart';
import 'package:healtyapps/running.dart';
import 'package:healtyapps/cuaca.dart';
import 'content_start.dart' as globals;

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffABA6E8),
      child: SafeArea(
          child: Scaffold(
        // ignore: use_full_hex_values_for_flutter_colors
        backgroundColor: const Color(0xffffffffff),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 25),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        "Hai ${globals.username}! \n\n",
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff481380),
                            shadows: <Shadow>[
                              Shadow(
                                  color: Color.fromARGB(64, 0, 0, 0),
                                  offset: Offset(0, 4),
                                  blurRadius: 4)
                            ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()));
                      },
                      child: Container(
                        height: 40,
                        width: 35,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/user.png"))),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                  "Create Your Goal For Your Feature",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 30),
                      height: 120,
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage("images/home1.png"),
                            fit: BoxFit.fill),
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 10,
                        //     offset: Offset(0, 5),
                        //     color: Colors.black.withOpacity(0.1),
                        //   ),
                        // ],
                      ),
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 200, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage("images/lari1.png")),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(left: 170, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "You are doing great",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff7F78D2),
                                shadows: <Shadow>[
                                  Shadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 3,
                                      color: Color.fromARGB(64, 0, 0, 0))
                                ]),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: const TextSpan(
                                  text: "Keep It Up\n",
                                  style: TextStyle(
                                    color: Color(0xff481380),
                                    fontSize: 14,
                                  ),
                                  children: [
                                TextSpan(
                                    text: "Stick To Your Plan",
                                    style: TextStyle(
                                      color: Color(0xff481380),
                                      fontSize: 14,
                                    ))
                              ]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 6,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                              flex: 6,
                              child: Stack(
                                children: <Widget>[
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          color: const Color(0xffffffff)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const Calculator();
                                      }));
                                    },
                                    child: const Center(
                                      child: Column(
                                        children: <Widget>[
                                          Flexible(
                                              flex: 7,
                                              child: Image(
                                                  image: AssetImage(
                                                      "images/home_bmi.png"))),
                                          Flexible(
                                              flex: 3,
                                              child: Text(
                                                "Calculator BMI",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff7F78D2),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          const Spacer(
                            flex: 2,
                          ),
                          Flexible(
                              flex: 6,
                              child: Stack(
                                children: <Widget>[
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          color: const Color(0xffffffff)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const TrackingRunningApp();
                                      }));
                                    },
                                    child: const Center(
                                      child: Column(
                                        children: <Widget>[
                                          Flexible(
                                              flex: 7,
                                              child: Image(
                                                  image: AssetImage(
                                                      "images/home_run.png"))),
                                          Flexible(
                                              flex: 3,
                                              child: Text(
                                                "Running",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff7F78D2),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Flexible(
                      flex: 6,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                              flex: 6,
                              child: Stack(
                                children: <Widget>[
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          color: const Color(0xffffffff)),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const SleepCalculator();
                                        }));
                                      },
                                      child: const Center(
                                        child: Column(
                                          children: <Widget>[
                                            Flexible(
                                                flex: 7,
                                                child: Image(
                                                    image: AssetImage(
                                                        "images/home_sleep.png"))),
                                            Flexible(
                                                flex: 3,
                                                child: Text(
                                                  "Sleep Treaker",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff7F78D2),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ))
                                ],
                              )),
                          const Spacer(
                            flex: 2,
                          ),
                          Flexible(
                              flex: 6,
                              child: Stack(
                                children: <Widget>[
                                  Material(
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          color: const Color(0xffffffff)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const Cuaca();
                                      }));
                                    },
                                    child: const Center(
                                      child: Column(
                                        children: <Widget>[
                                          Flexible(
                                              flex: 6,
                                              child: Image(
                                                  image: AssetImage(
                                                      "images/cuaca.png"))),
                                          Flexible(
                                              flex: 3,
                                              child: Text(
                                                "Weather",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff7F78D2),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
