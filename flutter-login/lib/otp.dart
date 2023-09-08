import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myloginapp/main.dart';
import 'package:myloginapp/schoolicon_icons.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 100),
              child: Icon(
                Schoolicon.user_graduate,
                color: HexColor("454d96"),
                size: 80,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "OTP has been send to you your\n"
                "mobile phone . Please wait for 5 munites",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: OtpTextField(
                numberOfFields: 4,
                focusedBorderColor: HexColor("454d96"),
                showFieldAsBox: false,
                borderWidth: 4.0,
                enabledBorderColor: Colors.grey,
                onCodeChanged: (String code) {},
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {},
              ),
            ),
            SizedBox(height: 50),
            TextButton(
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => MyApp());
                  Navigator.pushReplacement(context, route);
                },
                child: Text(
                  "VERIFY",
                  style: TextStyle(color: Colors.grey),
                ))
          ],
        )),
      ),
    );
  }
}
