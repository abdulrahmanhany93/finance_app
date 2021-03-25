import 'package:financeapp/SignPage/ForgetPassword.dart';
import 'package:financeapp/models/usercontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:financeapp/NavigationBar/Navigator.dart';
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

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context,child,UserController user){
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
                  textInput('Email Address', FontAwesomeIcons.user,
                      emailController, emailKey),
                  textInput('Password', FontAwesomeIcons.unlock,
                      passwordController, passwordKey),
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
                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Some fields  required!',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                              ));
                            }
                            var result= await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                            if(result.user.uid.isNotEmpty){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationBar(result.user.uid,)));
                            }
                            if(result.user.uid.isEmpty){
                              return ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('No Account',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                              ));
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

  textInput(
      String hint, IconData icon, TextEditingController controller, Key key) {
    return Container(
        margin: EdgeInsets.only(bottom: 0, top: 15),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17), color: Colors.white),
        child: TextFormField(
          key: key,
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return '$hint is required';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(
              alignLabelWithHint: true,
              prefixIcon: Icon(
                icon,
                color: Colors.orange.shade600,
                size: 30,
              ),
              hintText: hint,
              border: InputBorder.none),
          style: TextStyle(color: Colors.red, fontSize: 22),
          keyboardType: TextInputType.emailAddress,
        ));
  }
}
