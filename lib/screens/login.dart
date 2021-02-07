import 'package:busapp/screens/conductor/home.dart';
import 'package:busapp/screens/forgetpass.dart';
import 'package:busapp/screens/homepage.dart';
import 'package:busapp/screens/register.dart';
import 'package:busapp/service/http.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  String errorMsg = "";
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  validate() async {
    print("HELLO");
    var email = _email.text;
    bool _isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    var password = _password.text;

    if (password.length != 0 && _isEmailValid) {
      login(email, password);
    } else {
      setState(() {
        errorMsg = "Please check Email and Password!";
      });
      print(errorMsg);
    }
  }

  login(String email, String password) async {
    var data = {"email": email.toString(), "password": password.toString()};
    print(data);
    var result = await httpPost("api/v1/user/auth/signin", data);
    print(result);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) =>
          result["status"] == 200 ? Homepage() : ConductorHome(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Login',
                    style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Rubik")),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Rubik"),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)))),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      controller: _password,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: _isObscure
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.black45,
                                  )
                                : Icon(Icons.visibility_off,
                                    color: Colors.black45),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Rubik"),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)))),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      //  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //    builder: (context) => Homepage(),
                      // ));
                      validate();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Rubik"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Register(),
                      ));
                    },
                    child: Text(
                      "New Here? Register",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Rubik",
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
