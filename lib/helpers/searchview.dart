import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../tool/applayout.dart';
import '../tool/appstate.dart';

class searchview extends StatelessWidget {
  const searchview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppState provider = Provider.of<AppState>(context);

    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.green.withOpacity(0.2),
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5,bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Icon(Icons.search,),

          Flexible(
            child: TextField(
              style: TextStyle(fontFamily: "big", fontSize: AppLayout.getwidth(context)*0.04),
              controller: provider.textEditingController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Search",
              ),
              onChanged: (val){
                provider.notifyListeners();
              },
            ),
          ),
          InkWell(
              onTap: () {
                provider.textEditingController!.clear();
                provider.notifyListeners();
              },
              child: const Icon(Icons.clear,)
          ),
        ],
      ),
    );
  }
}
