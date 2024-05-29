//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart'; //--------------------------
import 'package:flutter/material.dart';
import 'package:project3/models/UserModel.dart';
import 'package:project3/screen/wrapper.dart';
import 'package:project3/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ------------------
  await Firebase.initializeApp(); // --------------------
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: "null"),
      value: AuthServices().user,
      child: MaterialApp(
        home:Wrapper(),
      ),
    );
  }
}
