import 'package:flutter/material.dart';
import 'package:financeapp/Widgets/TransActionContainer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,toolbarHeight: 0,),
      body:  Container(
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                  'Recent Transactions',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
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
                    TransActionContainer("Car Repair", "Belong Interactive", 2796,
                        FontAwesomeIcons.tools),
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
                    TransActionContainer("Car Repair", "Belong Interactive", 2796,
                        FontAwesomeIcons.tools),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
