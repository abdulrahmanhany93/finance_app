import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TransActionContainer extends StatefulWidget {
  TransActionContainer(this.title, this.subtitle, this.money, this.icon);
 final String title;
  final String subtitle;
  final double money;
  final IconData icon;
  @override
  _TransActionContainerState createState() => _TransActionContainerState();
}

class _TransActionContainerState extends State<TransActionContainer> {
  NumberFormat digit = NumberFormat("#,##0.00", "en_US");
  @override
  Widget build(BuildContext context) {
      return Container(
          height: 100,
          margin: EdgeInsets.only(bottom: 20,left: 0,right: 15),
          padding: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: Color(0xff242424),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListTile(
            leading: Container(
              width: 70,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xffFE752F),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                widget.icon,
                size: 43,
                color: Colors.white,
              ),
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              widget.subtitle,
              style: TextStyle(
                  color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              "\$ ${digit.format(widget.money)}",
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ));
    }
  }

