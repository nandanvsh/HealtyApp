import 'package:flutter/material.dart';
import 'package:healtyapps/login.dart';
import 'content_start.dart' as globals;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "";
  String username = "";
  String password = "";

  TextEditingController Email = TextEditingController();
  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffABA6E8),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff7F78D2),
          body: Container(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                        child: Image(image: AssetImage("images/register.png"))),
                    Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Create An Account",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xfffffffff),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Column(
                              children: <Widget>[
                                fieldDaftar("Email", Email),
                                fieldDaftar("Username ", Username),
                                fieldDaftar("Password", Password)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 35),
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const Login(
                                        emailUser: "",
                                        passwordUser: "",
                                        username: "",
                                      );
                                    }));
                                  },
                                  child: const Text(
                                    "Sign in",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xfffffffff)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(25),
                            color: Color.fromARGB(255, 234, 230, 230),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20, top: 10),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Material(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    username = Username.text;
                                    password = Password.text;
                                    email = Email.text;

                                    globals.username = username;

                                    if (username == "" ||
                                        password == "" ||
                                        email == "") {
                                      // kondisi jika username, password, dan email kosong
                                      alertDialog(context, "Registrasi Gagal",
                                          "Username, Email, dan Password tidak boleh kosong");
                                    } else {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Login(
                                          emailUser: email,
                                          passwordUser: password,
                                          username: username,
                                        );
                                      }));
                                    }
                                  },
                                  child: const Center(
                                    child: Text(
                                      "Sign Up",
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

  Container fieldDaftar(String label, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(23),
            )),
      ),
    );
  }
}
