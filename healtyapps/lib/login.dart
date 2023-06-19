import 'package:flutter/material.dart';
import 'package:healtyapps/navbar.dart';
import 'package:healtyapps/register.dart';

class Login extends StatefulWidget {
  final String username;
  final String emailUser;
  final String passwordUser;

  const Login(
      {super.key,
      required this.username,
      required this.emailUser,
      required this.passwordUser});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";

  // ignore: non_constant_identifier_names
  TextEditingController Email = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController Password = TextEditingController();
  var pass = TextEditingController();
  bool passwordHide = false;

  @override
  void initState() {
    super.initState();
    passwordHide = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffABA6E8),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff7F78D2),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 60,
                  ),
                  const Image(image: AssetImage("images/login.png")),
                  Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Create An Account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          // ignore: use_full_hex_values_for_flutter_colors
                          color: Color(0xfffffffff),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Column(
                          children: <Widget>[
                            fieldMasuk("Email", Email),
                            TextField(
                              controller: pass,
                              obscureText: passwordHide,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        passwordHide = !passwordHide;
                                      });
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 35),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const Register();
                                  }));
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 15,
                                      // ignore: use_full_hex_values_for_flutter_colors
                                      color: Color(0xfffffffff)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 234, 230, 230),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20, top: 10),
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: Material(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  password = Password.text;
                                  email = Email.text;
                                  if (email == "") {
                                    alertDialog(context, "Login Gagal",
                                        "Email atau Password tidak boleh kosong");
                                  } else if (email != widget.emailUser ||
                                      password != widget.passwordUser) {
                                    alertDialog(context, "Login Gagal",
                                        "Email atau Password Salah");
                                  } else {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const BottomNavbar();
                                    }));
                                  }
                                },
                                child: const Center(
                                  child: Text(
                                    "Sign In",
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> alertDialog(BuildContext context, String title, content) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Container fieldMasuk(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            labelStyle:
                const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(23),
            )),
      ),
    );
  }
}
