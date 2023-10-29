

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime kStartDate=DateTime.utc(2010, 10, 16) ;
 DateTime kEndDate= DateTime.utc(2030, 3, 14);

 DateTime kNowDate = DateTime.now();

TimeOfDay kNowTime = TimeOfDay.now();


String kFormatDate = DateFormat('dd-MM-yyyy').format(kNowDate);

// String formatSelectDate="";