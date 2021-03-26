import 'package:flutter/material.dart';
class InputText extends StatelessWidget {
  final String hint;
  final IconData leftIcon;
  final TextEditingController controller;
  final Key key;
  final IconData rightIcon;
  final Function action;
  final bool redEye;
  InputText(
      this.hint, this.leftIcon, this.controller, this.key,this.redEye,{this.rightIcon,this.action});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 0, top: 15),
        padding: EdgeInsets.only(left: 10,right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17), color: Colors.white),
        child: TextFormField(
          key: key,
          obscureText: redEye,
          obscuringCharacter: '*',
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
                leftIcon,
                color: Colors.orange.shade600,
                size: 30,
              ),
              suffixIcon: IconButton(
                icon: Icon(rightIcon, color: Colors.orange.shade600, size: 23),
                onPressed: action
                ,
              ),
              hintText: hint,
              border: InputBorder.none),
          style: TextStyle(color: Colors.red, fontSize: 22),
          keyboardType: TextInputType.emailAddress,
        ));
  }
}
