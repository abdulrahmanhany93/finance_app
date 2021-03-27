import 'package:device_preview/device_preview.dart';
import 'package:financeapp/Widgets/TransActionContainer.dart';
import 'package:financeapp/Widgets/visaCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:financeapp/models/usercontroller.dart';
class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: Color(0xff000000),
      body: LayoutBuilder(builder: (context,constraints){
        var orientation=MediaQuery.of(context).orientation;
        if(orientation==Orientation.portrait){
          return Container(
            margin: EdgeInsets.only(
              left: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Your Cards',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ScopedModelDescendant(
                  builder: (context,child,UserController user){
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'You have ${user.userData.numberOfAcc.toString()} Active Cards',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  },

                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  child: VisaCard(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 10, left: 5),
                  child: Text(
                    'Recent Transactions',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      TransActionContainer("Salary", "Belong Interactive", 1200,
                          Icons.business_center_outlined),
                      TransActionContainer(
                          "PayPal", "Web Tech", 1495, FontAwesomeIcons.paypal),
                      TransActionContainer("Car Repair", "Belong Interactive", 2796,
                          FontAwesomeIcons.tools),
                      TransActionContainer("Salary", "Belong Interactive", 1200,
                          Icons.business_center_outlined),
                      TransActionContainer(
                          "PayPal", "Web Tech", 1495, FontAwesomeIcons.paypal),
                    ],
                  ),
                )
              ],
            ),
          );
        }
       else{
  return Container(
    margin: EdgeInsets.only(
      left: 15,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Text(
            'Your Cards',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        ScopedModelDescendant(
          builder: (context,child,UserController user){
            return Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                'You have ${user.userData.numberOfAcc.toString()} Active Cards',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            );
          },

        ),
        Container(
          height: 200,
          child: VisaCard(),
        ),
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 10, left: 5),
          child: Text(
            'Recent Transactions',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              TransActionContainer("Salary", "Belong Interactive", 1200,
                  Icons.business_center_outlined),
              TransActionContainer(
                  "PayPal", "Web Tech", 1495, FontAwesomeIcons.paypal),
              TransActionContainer("Car Repair", "Belong Interactive", 2796,
                  FontAwesomeIcons.tools),
              TransActionContainer("Salary", "Belong Interactive", 1200,
                  Icons.business_center_outlined),
              TransActionContainer(
                  "PayPal", "Web Tech", 1495, FontAwesomeIcons.paypal),
            ],
          ),
        )
      ],
    ),
  );
        }
      },)
    );
  }
}
