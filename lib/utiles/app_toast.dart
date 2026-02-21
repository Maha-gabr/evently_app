import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AppToast {
  static Future<bool?> appToast(
      {
        final String text = ' Updated Successfully',
        final Color color = Colors.green
      }
      )async{
    return await Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}