import 'package:flutter/material.dart';
import 'package:project3/models/UserModel.dart';
import 'package:project3/screen/authenticate/authenticate.dart';
import 'package:project3/screen/home/home.dart';
import 'package:provider/provider.dart';
//import 'package:project3/screen/authenticate/register.dart';
//import 'package:project3/screen/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
