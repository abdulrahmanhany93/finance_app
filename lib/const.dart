import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
NumberFormat digit = NumberFormat("#,##0.0", "en_US");
Color active = Color(0xffFE752F);
Color inactive = Color(0xff242424);
enum date { specific, one, six, twelve }
date choose = date.specific;