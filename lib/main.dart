import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App Sets"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "We sent the otp in 89******89, please check this and fill the otp below",
              style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  otpbox(context),
                  otpbox(context),
                  otpbox(context),
                  otpbox(context),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        fixedSize: Size(150.0, 45.0)),
                    onPressed: () {},
                    child: const Text("Cancel")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                        fixedSize: Size(150.0, 45.0)),
                    onPressed: () {},
                    child: const Text("Submit")),
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox otpbox(BuildContext context) {
    return SizedBox(
      height: 68.0,
      width: 48.0,
      child: TextFormField(
        style: Theme.of(context).textTheme.headline6,
        decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0))),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
