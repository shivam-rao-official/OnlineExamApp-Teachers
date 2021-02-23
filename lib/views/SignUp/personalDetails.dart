// Module Import
import 'package:flutter/material.dart';

String name;
String email;
String phnNumber;

class PersonalDetailsBox extends StatefulWidget {
  @override
  _PersonalDetailsBoxState createState() => _PersonalDetailsBoxState();
}

class _PersonalDetailsBoxState extends State<PersonalDetailsBox> {
  final _signUpProceedKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black45,
            width: 3,
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Form(
                key: _signUpProceedKey,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    label("Personal Details", 30),
                    SizedBox(height: 30),

                    ///
                    ///   NAME FIELD
                    ///
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          name = val;
                        },
                        onSaved: (val) {
                          name = val;
                        },
                        validator: (val) {
                          return val.isEmpty
                              ? "Name is required"
                              : val.length <= 2
                                  ? "Name must be of 3 character long."
                                  : null;
                        },
                        decoration:
                            decoration("Name", 20, 20, Icons.person, null),
                      ),
                    ),
                    SizedBox(height: 30),

                    ///
                    ///   EMAIL FIELD
                    ///
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          email = val;
                        },
                        onSaved: (val) {
                          email = val;
                        },
                        validator: (val) {
                          return val.isEmpty ? "Email is required" : null;
                        },
                        decoration:
                            decoration("Email", 20, 20, Icons.email, null),
                      ),
                    ),
                    SizedBox(height: 30),

                    ///
                    ///   PHONE FIELD
                    ///
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        onChanged: (val) {
                          phnNumber = val;
                        },
                        onSaved: (val) {
                          phnNumber = val;
                        },
                        validator: (val) {
                          return val.isEmpty
                              ? "Phone number is required"
                              : val.length < 10 || val.length > 10
                                  ? "Enter a valid Number"
                                  : null;
                        },
                        decoration: decoration(
                            "Phone", 20, 20, Icons.phone_android, null),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (_signUpProceedKey.currentState.validate()) {
                          signUpMessage();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 70,
                          right: 70,
                          bottom: 15,
                          top: 15,
                        ),
                        child: signUpButtonText(),
                      ),
                      shape: signUpButtonShape(),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration decoration(String text, double radius, double textSize,
      IconData icon, IconData sufIcon) {
    return InputDecoration(
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.black54,
        fontSize: textSize,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: Colors.black54,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          color: Colors.black54,
        ),
      ),
      prefixIcon: Icon(
        icon,
        color: Colors.black54,
      ),
    );
  }

  signUpButtonText() {
    return Text(
      "Proceed",
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 30,
        color: Colors.black,
      ),
    );
  }

  signUpButtonShape() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }

  signUpMessage() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Login Alert"),
          content: Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("User Logged In Succesfully"),
                Text("Name : $name"),
                Text("Phone Number : $phnNumber"),
                Text("Email : $email"),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Proceed"),
              onPressed: signUpRoute,
            ),
          ],
        );
      },
    );
  }

  signUpRoute() {
    Navigator.of(context).pushReplacementNamed('/signup2', arguments: {
      'name': name,
      'email': email,
      'phone': phnNumber,
    });
  }

  label(String label, double fontSize) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
