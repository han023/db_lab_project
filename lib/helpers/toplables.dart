import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tool/applayout.dart';

class toplables extends StatelessWidget {
  toplables({Key? key,required this.lablelist}) : super(key: key);
  List lablelist;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppLayout.getwidth(context),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.withOpacity(0.2)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          lablelist[0]!=""?
          Expanded(child: Center(child: Text(lablelist[0],style: TextStyle(fontFamily: "big",fontSize: AppLayout.getwidth(context)*0.035),)))
          :const SizedBox.shrink(),
          lablelist[1]!=""?
          Container( width: 1,height: 20, color: Colors.black,):const SizedBox.shrink(),
          lablelist[1]!=""?
          Expanded(child: Center(child: Text(lablelist[1],style: TextStyle(fontFamily: "big",fontSize: AppLayout.getwidth(context)*0.035),)))
              :const SizedBox.shrink(),
          lablelist[2]!=""?
          Container( width: 1,height: 20, color: Colors.black,):const SizedBox.shrink(),
          lablelist[2]!=""?
          Expanded(child: Center(child: Text(lablelist[2],style: TextStyle(fontFamily: "big",fontSize: AppLayout.getwidth(context)*0.035),)))
              :const SizedBox.shrink(),
          lablelist[3]!=""?
          Container( width: 1,height: 20, color: Colors.black,):const SizedBox.shrink(),
          lablelist[3]!=""?
          Expanded(child: Center(child: Text(lablelist[3],style: TextStyle(fontFamily: "big",fontSize: AppLayout.getwidth(context)*0.035),)))
              :const SizedBox.shrink(),
        ],
      ),
    );
  }
}
