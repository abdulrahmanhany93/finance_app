import 'package:financeapp/Widgets/chart.dart';
import 'package:financeapp/Widgets/loading.dart';
import 'package:financeapp/const.dart';
import 'package:financeapp/models/usercontroller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  final UserController user;
  final String userId;

  HomePage({this.user, this.userId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    widget.user.getData(widget.userId);
    super.initState();
  }

  date choose = date.specific;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 10,
        automaticallyImplyLeading: false,
      ),
      body:
          ScopedModelDescendant(builder: (context, child, UserController user) {
        if (user.isGetDataLoading == true) {
          return Loading();
        } else {
          return ListView(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.01),
            children: [
              Text(
                'Your Balance',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Money Received',
                style: TextStyle(
                    color: Colors.white30,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              headLine('\$ ' + digit.format(user.userData.balance), "15 \$ ",
                  FontAwesomeIcons.arrowUp, 35),
              Chart(50, 50, 0, 0, [
                FlSpot(-20, 0),
                FlSpot(10, 40),
                FlSpot(20, 20),
                FlSpot(30, 15),
                FlSpot(35, 25),
                FlSpot(40, 40),
                FlSpot(50, 45),
              ]),
              statics(),
              Divider(),
              headLine('Income', "75\% ", FontAwesomeIcons.arrowUp, 25),
              Divider(
                height: 25,
              ),
              headLine('OutCome', "25\% ", FontAwesomeIcons.arrowDown, 25),
            ],
          );
        }
      }),
    );
  }

  statics() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 15),
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListView(
        cacheExtent: 10,
        scrollDirection: Axis.horizontal,
        children: [
          select(MediaQuery.of(context).size.width * 0.3, "Apr To Jun",
              choose == date.specific ? active : inactive, () {
            setState(() {
              choose = date.specific;
            });
          }),
          select(MediaQuery.of(context).size.width * 0.2, "1 Month",
              choose == date.one ? active : inactive, () {
            setState(() {
              choose = date.one;
            });
          }),
          select(MediaQuery.of(context).size.width * 0.2, "6 Month",
              choose == date.six ? active : inactive, () {
            setState(() {
              choose = date.six;
            });
          }),
          select(MediaQuery.of(context).size.width * 0.2, "1 Year",
              choose == date.twelve ? active : inactive, () {
            setState(() {
              choose = date.twelve;
            });
          })
        ],
      ),
    );
  }

  headLine(String title, String trailing, IconData icon, double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: size, fontWeight: FontWeight.bold),
        ),
        RichText(
          text: TextSpan(
              text: trailing,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              children: [
                WidgetSpan(
                    child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ))
              ]),
        ),
      ],
    );
  }

  select(double width, String text, Color color, Function action) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(17)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
