import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myloginapp/home.dart';
import 'package:myloginapp/schoolicon_icons.dart';
import 'package:myloginapp/signup.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Logger logger = Logger();
  bool isPasswordVisible = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  get storage => null;
  void _toggleObscured() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Future<void> _login(BuildContext context) async {
    try {
      var url = Uri.parse('https://dummyjson.com/auth/login');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': emailController.text,
          'password': passwordController.text,
          // 'expiresInMins': 60, // optional
        }),
      );
// username: 'kminchelle',
      // password: '0lelplR',['token']
      // ignore: unnecessary_null_comparison, unrelated_type_equality_checks

      final dataBody = jsonDecode(response.body);
      const storage = FlutterSecureStorage();
      await storage.write(key: "jwt", value: dataBody['token']);
      // logger.d("test:$jwt");

// logger.d("test:$jwt");
      //   Navigator.push(context,
      //       MaterialPageRoute(builder: (context) => Home.fromBase64(jwt)));
      // } else {
      // logger.e(context);
      // displayDialog(context, "An Error Occurred",
      //     "No account was found matching that username and password");
      // }
      // MaterialPageRoute routehome =
      //     MaterialPageRoute(builder: (context) => Home());
      // Navigator.pushReplacement(context, routehome);
      // Login successful, navigate to the next screen
      // Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      // Handle login error
      logger.d('Login failed: $e');
    }
  }

  get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  top: 90.0, bottom: 20.0, left: 50.0, right: 50.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 25.0, right: 5.0),
                  child: const Column(
                    children: [
                      Icon(
                        Schoolicon.graduation,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "CEIT",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: HexColor("454d96"),
                    borderRadius: BorderRadius.circular(65.0),
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // labelText: 'Email',
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey))),
                ])),
            const SizedBox(height: 15),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        "Password",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            _toggleObscured();
                          },
                        )),
                    obscureText: isPasswordVisible,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180, top: 20),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ])),
            Container(
              width: 300,
              height: 40,
              // decoration: BoxDecoration(
              //   color: HexColor("454d96"),
              //   borderRadius: BorderRadius.circular(65.0),
              // ),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(HexColor("454d96")),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)))),
                child: const Text('Login'),
                onPressed: () {
                  _login(context);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New user?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) => const Signup());
                      Navigator.pushReplacement(context, route);
                    },
                    child: const Text("Sign Up")),
              ],
            )
          ],
        )),
      ),
    );
  }

  void displayDialog(BuildContext context, String s, String t) {}
}
