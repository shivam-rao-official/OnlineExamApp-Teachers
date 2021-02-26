// Module Import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

String name;
String email;
String teacherId;
String password;
String _name;
String _id;
String _token;
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

  static const String url =
      "https://online-examination-revised.herokuapp.com/teacherapi/login";

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
                          setState(() {
                            postData();
                          });
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

  signInMessage(bool success, String msg) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return success
            ? AlertDialog(
                title: Text("Login Alert"),
                content: Container(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Logged In Succesfully"),
                      Text("Name : $msg"),
                      Text("Teacher ID : $teacherId"),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text("Proceed"),
                    onPressed: signInRoute,
                  ),
                ],
              )
            : AlertDialog(
                title: Text("Login Alert"),
                content: Container(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Oops Error Occured"),
                      Text("Error Message ಥ_ಥ ಥ_ಥ"),
                      Text("$msg"),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text("Retry"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
      },
    );
  }

  Future<void> postData() async {
    var req = await http.post(url, body: {
      'teacherId': teacherId,
      'password': password,
    });
    var res = await convert.jsonDecode(req.body);
    if (req.statusCode == 200) {
      //  For accessing the success and error field
      //  And pass this to generate respective message
      _name = await res['data']['name'];
      _id = teacherId;
      _token = await res['token'];
      signInMessage(res['success'], res['data']['name']);
    } else {
      // print(res);
      signInMessage(res['success'], res['error']);
    }
  }

  Future signInRoute() async {
    SharedPreferences _loginPrefs = await SharedPreferences.getInstance();
    //  Storing Login Details in Shred Prefs
    await _loginPrefs.setString('NAME', _name);
    await _loginPrefs.setString('TOKEN', _token);
    // await _loginPrefs.setString('EMAIL', email);
    await _loginPrefs.setString('ID', _id);
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/homescreen');
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
