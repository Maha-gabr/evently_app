import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDataTimeFunction {
  static DateTime? chooseDate;
  static TimeOfDay? chooseTime;
  static String dateFormate ='';
  static String timeFormate ='';
  static Future<void> datePicker(BuildContext context)async{
    chooseDate=await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
      if(chooseDate != null){
        dateFormate = DateFormat('MMM d, yyyy').format(chooseDate!);
    }

  }

  static Future<void> timePicker(BuildContext context)async{
     chooseTime =await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );
    if(chooseDate != null){
      timeFormate= chooseTime!.format(context);
    }
  }
}
