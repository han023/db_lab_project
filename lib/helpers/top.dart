import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tool/applayout.dart';

class top extends StatelessWidget {
  top({Key? key,required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppLayout.getwidth(context),
      height: 70,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              width: AppLayout.getwidth(context)*0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.withOpacity(0.2)
              ),
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(title,style: TextStyle(fontFamily: "big",fontSize: AppLayout.getwidth(context)*0.055),maxLines: 1,overflow: TextOverflow.ellipsis,),
          )

        ],
      ),
    );
  }
}
