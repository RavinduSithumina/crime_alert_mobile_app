import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project3/constants/color.dart';
import 'package:project3/constants/style.dart';
import 'package:project3/services/auth.dart'; // ---------------

class Sign_In extends StatefulWidget {
  final Function toggle;
  const Sign_In({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
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
            "Sign In",
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
                Text(
                  "Login Your account",
                  style: des,
                ),
                SizedBox(
                  height: 20,
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

                          Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
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
                                "Do no have account",
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
                                    "Register",
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
                                  .signInUsingEmailAndPassword(email, password);

                              if (result == null) {
                                setState(() {
                                  error = "USer name or PAssword incorrect";
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
                                "Log In",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //anon

                          GestureDetector(
                            onTap: () async {
                              await _auth.signInAnonymously();
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
                                "Log In as Guest",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              )),
                            ),
                          ),
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
