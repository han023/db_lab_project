import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/home.dart';


class AppState extends ChangeNotifier {

  Future<void> change_screen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3), () {
      try {
        Navigator.pushReplacement(context, PageTransition(
            child:  const home(), type: PageTransitionType.fade));
      } catch (e) {}
    });
  }

  TextEditingController? textEditingController = TextEditingController();

  String name='',location='',fac='';
}

