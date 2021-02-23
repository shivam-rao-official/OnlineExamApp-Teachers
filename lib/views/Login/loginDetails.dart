// Module Import
import 'package:flutter/material.dart';

String name;
String email;
String teacherId;
String password;
bool _obscure = true;
int counter = 0;

class LoginDetailsBox extends StatefulWidget {
  @override
  _LoginDetailsBoxState createState() => _LoginDetailsBoxState();
}

class _LoginDetailsBoxState extends State<LoginDetailsBox> {
  final _loginFormKey = GlobalKey<FormState>();

  bool isObscure() {
    counter++;
    print(counter);
    return counter % 2 != 0 ? false : true;
  }

  @override
  // ignore: must_call_super
  void dispose() {
    super.dispose();
    name = null;
    email = null;
    teacherId = null;
    password = null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
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
                key: _loginFormKey,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    label("Login Details", 30),
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
                    ///   TEACHER ID FIELD
                    ///
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          teacherId = val;
                        },
                        onSaved: (val) {
                          teacherId = val;
                        },
                        validator: (val) {
                          return val.isEmpty
                              ? "Teacher ID is required"
                              : val.length <= 5
                                  ? "Name must be of 6 character long."
                                  : null;
                        },
                        decoration:
                            decoration("Teacher ID", 20, 20, null, null),
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
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) {
                          email = val;
                        },
                        onSaved: (val) {
                          email = val;
                        },
                        validator: (val) {
                          return val.isEmpty ? "Email must not be Empty" : null;
                        },
                        decoration:
                            decoration("Email", 20, 20, Icons.email, null),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        onChanged: (val) {
                          password = val;
                        },
                        onSaved: (val) {
                          password = val;
                        },
                        validator: (val) {
                          return val.isEmpty
                              ? "Pasword must not be Empty"
                              : val.length <= 4
                                  ? "Password must be 5 characters long"
                                  : null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscuringCharacter: '*',
                        obscureText: _obscure,
                        decoration: decoration(
                            "Password",
                            20,
                            20,
                            Icons.lock,
                            _obscure == false
                                ? Icons.visibility
                                : Icons.visibility_off_rounded),
                      ),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        if (_loginFormKey.currentState.validate()) {
                          signInMessage();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 70,
                          right: 70,
                          bottom: 15,
                          top: 15,
                        ),
                        child: signInButtonText(),
                      ),
                      shape: signInButtonShape(),
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
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _obscure = isObscure();
          });
        },
        icon: Icon(sufIcon),
        color: Colors.black54,
      ),
    );
  }

  signInButtonText() {
    return Text(
      "Sign In",
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 30,
        color: Colors.black,
      ),
    );
  }

  signInButtonShape() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }

  signInMessage() {
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
                Text("Teacher ID : $teacherId"),
                Text("Email : $email"),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Proceed"),
              onPressed: signInRoute,
            ),
          ],
        );
      },
    );
  }

  signInRoute() {
    Navigator.of(context).pushReplacementNamed('/homescreen', arguments: {
      'name': name,
      'teacherId': teacherId,
      'email': email,
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
