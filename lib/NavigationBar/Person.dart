import 'package:flutter/material.dart';
class Person extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 30,
        toolbarHeight: 50,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 30,
          top: 10,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent.fcai3-1.fna.fbcdn.net/v/t1.0-9/122668576_3540912739308597_6214632756950452822_o.jpg?_nc_cat=109&ccb=3&_nc_sid=09cbfe&_nc_ohc=4JnJTh4-bTkAX9MOs_L&_nc_ht=scontent.fcai3-1.fna&oh=9a371326ddf7a36ad895d717eedf82ef&oe=60685273'),
                  radius: 50,
                ),
                Text(
                  'Abdul-Rahman Hany',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ],
            ),
            PCard(' abdulrahmanhany93@gmail.com', Icons.mail),
            PCard('*******', Icons.lock),
            PCard('5/5/2001', Icons.calendar_today),
            PCard('English', Icons.language),
            PCard('Sign Out', Icons.exit_to_app),

          ],
        ),
      ),
    );
  }

}
class PCard extends StatefulWidget {
  final String text;
  final IconData icon;
  PCard(this.text,this.icon);

  @override
  _PCardState createState() => _PCardState();
}

class _PCardState extends State<PCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 15,left: 5),
      padding: EdgeInsets.fromLTRB(10, 0, 7, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(widget.icon,color: Colors.orange,),
          Text(widget.text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.start,),
          Icon(Icons.edit,color: Colors.grey,),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff242424),
      ),
    );
  }
}
