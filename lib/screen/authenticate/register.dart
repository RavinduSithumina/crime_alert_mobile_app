import 'package:flutter/material.dart';
import 'package:project3/constants/color.dart';
import 'package:project3/constants/style.dart';
import 'package:project3/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: textLight,
        //child: Text("Login"),
        appBar: AppBar(
          title: Text(
            "Register",
            style: topic,
          ),
          elevation: 0,
          backgroundColor: bgBlack,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "If you haven't account . You can register here",
                  style: des,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Image.asset(
                  'assets/logo.png',
                  height: 200,
                )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //email
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: tID,
                            validator: (val) =>
                                val?.isEmpty == true ? "Enter Email" : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          //password
                          TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: tID.copyWith(hintText: "password"),
                            validator: (val) =>
                                val!.length < 6 ? "Enter Password" : null,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(error, style: TextStyle(color: Colors.red)),
                          //google
                          Text("Login with social account", style: des),

                          SizedBox(
                            height: 10,
                          ),

                          GestureDetector(
                            onTap: () {},
                            child: Center(
                                child: Image.asset(
                              'assets/gmail.png',
                              height: 50,
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //register
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already you have account",
                                style: des,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    widget.toggle();
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: mainBlue,
                                        fontWeight: FontWeight.w600),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),

                          //button
                          SizedBox(
                            height: 10,
                          ),

                          GestureDetector(
                            onTap: () async {
                              dynamic result = await _auth
                                  .registerWithEmailAndPasword(email, password);

                              if (result == null) {
                                setState(() {
                                  error = "place enter valid email";
                                });
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: mainwhite,
                                  borderRadius: BorderRadius.circular(50),
                                  border:
                                      Border.all(width: 2, color: mainYellow)),
                              child: Center(
                                  child: Text(
                                "Register",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //anon
                        ],
                      )),
                )
              ],
            ),
          ),
        )

        //  ElevatedButton(
        //   child: const Text("Sign in anonymously"),
        //   onPressed: () async {
        //     dynamic result = await _auth.signInAnonymously();
        //     if (result == null) {
        //       print("error in sign in anon");
        //     } else {
        //       print("signed in anon");
        //       print(result.uid);
        //     }
        //   },
        // ),
        );
  }
}
