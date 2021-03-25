import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> emailKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
                textInput('Email Address', FontAwesomeIcons.user, emailController,
                    emailKey),
                Column(
                  children: [
                    Builder(builder: (BuildContext context) {
                      return TextButton(
                        onPressed: () {
                          if (!formKey.currentState.validate()) {
                            return snack('Email Required!');
                          }
                          else{
                             snack('Check your mail to reset password');
                             Navigator.pop(context);
                          }
                        },
                        child: Text(
                          'Send Email',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white30)),
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
  }
  snack(String content){
    return  ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
      content: Text(content,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    ));
  }
  
  textInput(
      String hint, IconData icon, TextEditingController controller, Key key) {
    return Container(
        margin: EdgeInsets.only(bottom: 15,top: 15),
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
          style: TextStyle(color: Colors.red, fontSize: 25),
          keyboardType: TextInputType.emailAddress,
        ));
  }
}
