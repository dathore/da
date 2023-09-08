import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myloginapp/otp.dart';
import 'package:myloginapp/schoolicon_icons.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 20.0, left: 50.0, right: 50.0),
              child: Container(
                padding: EdgeInsets.only(top: 25.0, right: 8.0),
                child: Column(
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
            SizedBox(height: 15),
            //-----fullname------------
            Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        "Fullname",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // labelText: 'Email',
                          hintText: 'ມາລີນາ ເພັດຊົມພູ',
                          hintStyle: TextStyle(color: Colors.grey))),
                ])),
            SizedBox(height: 15),
            // ---------tel--------------
            Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(children: [
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text(
                        "Tel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // labelText: 'Email',
                          hintText: '2055555555',
                          hintStyle: TextStyle(color: Colors.grey))),
                ])),
            SizedBox(height: 15),
            // -----------email-----------------
            Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(children: [
                  Row(
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
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          // labelText: 'Email',
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(color: Colors.grey))),
                ])),
            SizedBox(height: 15),
            // --------password----------
            Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(children: [
                  Row(
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
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ])),
            SizedBox(
              height: 30,
            ),
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
                child: const Text('Sign Up'),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => Otp());
                  Navigator.pushReplacement(context, route);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: Text("Cancel")),
              ],
            )
          ],
        )),
      ),
    );
  }
}
