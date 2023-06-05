import 'package:db_lab_project/dbhelper/databasehelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/top.dart';
import '../../tool/applayout.dart';
import '../../tool/appstate.dart';

class addmewdepatment extends StatelessWidget {
  addmewdepatment({super.key,required this.name,required this.loaction,required this.fac,required this.update,
        required this.id});
  bool update;
  String name,loaction,fac,id;

  @override
  Widget build(BuildContext context) {

    AppState provider = Provider.of<AppState>(context,listen: true);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            top(title: 'Add new',),

            Container(
                width: AppLayout.getwidth(context),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Name",style: TextStyle(fontSize: AppLayout.getwidth(context)*0.04,fontFamily: "big"),),
                    TextFormField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontFamily: "small",fontSize: AppLayout.getwidth(context)*0.035),
                        hintText: "Name",
                      ),
                      initialValue: name,
                      style: TextStyle(fontFamily: "small",fontSize: AppLayout.getwidth(context)*0.035),
                      onChanged: (val){
                        provider.name = val;
                      },
                    )
                  ],
                )
            ),

            Container(
                width: AppLayout.getwidth(context),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Location",style: TextStyle(fontSize: AppLayout.getwidth(context)*0.04,fontFamily: "big"),),
                    TextFormField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontFamily: "small",fontSize: AppLayout.getwidth(context)*0.035),
                        hintText: "Location",
                      ),
                      initialValue: loaction,
                      style: TextStyle(fontFamily: "small",fontSize: AppLayout.getwidth(context)*0.035),
                      onChanged: (val){
                        provider.location = val;
                      },
                    )
                  ],
                )
            ),

            Container(
                width: AppLayout.getwidth(context),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Facility",style: TextStyle(fontSize: AppLayout.getwidth(context)*0.04,fontFamily: "big"),),
                    TextFormField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontFamily: "small",fontSize: AppLayout.getwidth(context)*0.035),
                        hintText: "Facility",
                      ),
                      initialValue: fac,
                      style: TextStyle(fontFamily: "small",fontSize: AppLayout.getwidth(context)*0.035),
                      onChanged: (val){
                        provider.fac = val;
                      },
                    )
                  ],
                )
            ),


            InkWell(
              onTap: () async {

                if(provider.name == "" || provider.location == '' || provider.fac==''){
                  AppLayout.showsnakbar(context, "Fill all fields");
                }else{
                  if(update){
                      databasehelper.updatedata(provider.name, provider.location, provider.fac,int.parse(id)).then((value) {
                        AppLayout.showsnakbar(context, "Update Sucessfully");
                        Navigator.pop(context);
                        provider.notifyListeners();
                      });
                  }else {
                    databasehelper.insertdata(provider.name,provider.location,provider.fac).then((value) {
                        AppLayout.showsnakbar(context, "Insert Sucessfully");
                        Navigator.pop(context);
                        provider.notifyListeners();
                    });
                  }
                }

              },
              child: Container(
                width: AppLayout.getwidth(context)*0.4,
                padding: const EdgeInsets.all(10),
                margin:const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.withOpacity(0.2)
                ),
                child: Center(child: Text(update?"update":"add"
                  ,style: TextStyle(fontSize: AppLayout.getwidth(context)*0.05,fontFamily: "big"),)),
              ),
            ),

         ],
       ),
      ),
    );
  }
}
