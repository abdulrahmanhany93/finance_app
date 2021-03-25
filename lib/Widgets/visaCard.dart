import 'package:financeapp/Widgets/loading.dart';
import 'package:financeapp/models/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class VisaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (context, child, UserController user) {
      if (user.isGetDataLoading == true) {
        return Loading();
      }
      if (user.userData == null) {
        return Center(
          child: Text('No Data'),
        );
      } else {
        return ListView.builder(
          scrollDirection:Axis.horizontal ,
            itemCount: user.userData.numberOfAcc,
            itemBuilder: (context, index) {
             return Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey,
                      Color(0xffDD601B),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 0.6],
                  ),
                  color: Color(0xffFE752F),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 10, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.credit_card,
                              size: 45,
                              color: Colors.white,
                            ),
                            Text(
                              'Visa',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          user.userData.visa[index.toString()],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'CARD HOLDER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              'Expiry Date',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              user.userData.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              user.userData.visaExpire,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ]),
                ),
              );
            });
      }
    });
  }
}
