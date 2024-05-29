import 'package:flutter/material.dart';
import 'package:project3/constants/color.dart';
import 'package:project3/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: textLight,
        appBar: AppBar(
          backgroundColor: bgBlack,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(bgBlack)),
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
