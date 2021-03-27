import 'package:financeapp/models/usercontroller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:device_preview/device_preview.dart';
import 'SignPage/Signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: UserController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
