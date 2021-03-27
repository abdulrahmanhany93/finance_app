import 'package:financeapp/NavigationBar/navigator.dart';
import 'package:financeapp/SignPage/ForgetPassword.dart';
import 'package:financeapp/Widgets/inputText.dart';
import 'package:financeapp/models/usercontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> emailKey = GlobalKey();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> passwordKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (context, child, UserController user) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.orange[800],
              Colors.orange[700],
              Colors.orange[600],
              Colors.orange[400],
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Form(
            key: formKey,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/1.png')))),
                  InputText('Email Address', FontAwesomeIcons.user,
                      emailController, emailKey, false),
                  InputText('Password', FontAwesomeIcons.unlock,
                      passwordController, passwordKey, secure,
                      rightIcon: secure == true
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye, action: () {
                    setState(() {
                      secure = !secure;
                    });
                  }),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ForgetPassword()));
                        },
                        child: Align(
                          heightFactor: 1.5,
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forget Password !?',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Builder(builder: (BuildContext context) {
                        return TextButton(
                          onPressed: () async {
                            if (!formKey.currentState.validate()) {
                              return snack('Some fields  required!');
                            }
                            if (emailController.text.contains('@') == false ||
                                emailController.text.contains(".com") ==
                                    false) {
                              return snack('Enter valid email please');
                            }
                            var result = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text.toLowerCase(),
                                    password: passwordController.text);

                            if (result.user.uid.isNotEmpty) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavigationBar(
                                            result.user.uid,
                                          )));
                            }
                            if (result.user.uid.isEmpty) {
                              return snack('No Account');
                            }
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white24)),
                        );
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  snack(String content) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }
}
