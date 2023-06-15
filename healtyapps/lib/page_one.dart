import 'package:flutter/material.dart';
import 'package:healtyapps/login.dart';
import 'package:healtyapps/register.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color(0xffffffff),
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: const EdgeInsets.only(top: 70),
            child: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Image(
                      image: AssetImage("images/foto1.png"),
                      height: 300,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 23),
                  child: const Text(
                    "Healty Lovely",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff7F78D2),
                        shadows: <Shadow>[
                          Shadow(
                              color: Color.fromARGB(64, 0, 0, 0),
                              offset: Offset(0, 4),
                              blurRadius: 4)
                        ]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const Text(
                    "'Ciptakan kebiasaan sehat untuk hidup yang lebih baik, karena kesehatan adalah investasi terbaik'",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 50),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 213, 212, 233)),
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const Login(
                              username: "username",
                              emailUser: "emailUser",
                              passwordUser: "passwordUser");
                        }));
                      },
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff7F78D2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 5),
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const Register();
                        }));
                      },
                      child: const Center(
                        child: Text(
                          "Register",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
