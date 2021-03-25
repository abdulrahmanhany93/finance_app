import 'package:financeapp/NavigationBar/HomePage.dart';
import 'package:financeapp/NavigationBar/Person.dart';
import 'package:financeapp/NavigationBar/Transactions.dart';
import 'package:financeapp/NavigationBar/Wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:financeapp/models/usercontroller.dart';
class NavigationBar extends StatefulWidget {
final String userid;
  NavigationBar(this.userid);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: false,
        selectedItemColor: Colors.orange,
        selectedIconTheme: IconThemeData(size: 27),
        unselectedIconTheme: IconThemeData(size: 27),
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
        backgroundColor: Colors.black,
        currentIndex: current,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  FontAwesomeIcons.home,
              ),
              backgroundColor: Colors.transparent,
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.wallet,
              ),
              backgroundColor: Colors.transparent,
              label: 'Wallet'),
          BottomNavigationBarItem(
              icon: Icon(
                  FontAwesomeIcons.dollarSign
              ),
              backgroundColor: Colors.transparent,
              label: 'Transactions'),
          BottomNavigationBarItem(
              icon: Icon(
                  FontAwesomeIcons.user
              ),
              backgroundColor: Colors.transparent,
              label: 'Personal'),
        ],
      ),
      body: ScopedModelDescendant(
          builder: (context,child,UserController user){
            if(current==0){
              return HomePage(userId: widget.userid,user:user);
            }
            if(current==1){
              return Wallet();
            }
            if(current==2){
              return Transactions();
            }
            else{
              return Person();
            }
  })
    );
  }

}
