// Module Import
import 'package:flutter/material.dart';

String _name;
String _email;
String _phnNumber;
String teacherId;
String department;
String password;
String confirmPassword;
bool _obscure = true;
int counter = 0;

class CollegeDetailsBox extends StatefulWidget {
  @override
  _CollegeDetailsBoxState createState() => _CollegeDetailsBoxState();
}

class _CollegeDetailsBoxState extends State<CollegeDetailsBox> {
  bool isObscure() {
    counter++;
    print(counter);
    return counter % 2 != 0 ? false : true;
  }

  final _signUpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Map teacherDetails = ModalRoute.of(context).settings.arguments;
    _name = teacherDetails['name'];
    _email = teacherDetails['email'];
    _phnNumber = teacherDetails['phone'];
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
                key: _signUpKey,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    label("College Details", 30),
                    SizedBox(height: 30),

                    ///
                    ///   TeacherId FIELD
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
                                  ? "Teacher ID must be of 6 character long."
                                  : null;
                        },
                        decoration:
                            decoration("Teacher ID", 20, 20, null, null),
                      ),
                    ),
                    SizedBox(height: 30),

                    ///
                    ///   Department FIELD
                    ///
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          department = val;
                        },
                        onSaved: (val) {
                          department = val;
                        },
                        validator: (val) {
                          return val.isEmpty ? "Department is required" : null;
                        },
                        decoration:
                            decoration("Department", 20, 20, null, null),
                      ),
                    ),

                    SizedBox(height: 30),

                    ///
                    ///   PASSWORD FIELD
                    ///
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
                    SizedBox(
                      height: 20,
                    ),

                    ///
                    ///   CONFIRM PASSWORD FIELD
                    ///
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        onChanged: (val) {
                          confirmPassword = val;
                        },
                        onSaved: (val) {
                          confirmPassword = val;
                        },
                        validator: (val) {
                          return val.isEmpty
                              ? "Pasword must not be Empty"
                              : val.length <= 4
                                  ? "Password must be 5 characters long"
                                  : password != confirmPassword
                                      ? "Password not Matched"
                                      : null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscuringCharacter: '*',
                        obscureText: _obscure,
                        decoration: decoration(
                            "Confirm Password", 20, 20, Icons.lock, null),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (_signUpKey.currentState.validate()) {
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
      suffixIcon: text == "Password"
          ? IconButton(
              onPressed: () {
                setState(() {
                  _obscure = isObscure();
                });
              },
              icon: Icon(sufIcon),
              color: Colors.black54,
            )
          : null,
    );
  }

  signUpButtonText() {
    return Text(
      "Sign Up",
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
                Text("Teacher ID : $teacherId"),
                Text("Department : $department"),
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
    print(_name);
    Navigator.of(context).pushReplacementNamed('/homescreen', arguments: {
      'teacherId': teacherId,
      'dept': department,
      'name': _name,
      'email': _email,
      'phone': _phnNumber
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
