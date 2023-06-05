import 'package:db_lab_project/dbhelper/databasehelper.dart';
import 'package:db_lab_project/helpers/top.dart';
import 'package:db_lab_project/helpers/toplables.dart';
import 'package:db_lab_project/tool/applayout.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../helpers/searchview.dart';
import '../../tool/appstate.dart';
import 'addmewdepatment.dart';

class depatment extends StatelessWidget {
  const depatment({super.key});

  @override
  Widget build(BuildContext context) {

    AppState provider = Provider.of<AppState>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            top(title: 'Department'),

            const searchview(),

            toplables(lablelist: ['name','location','facility','']),

            Expanded(
              child: FutureBuilder(
                  future: databasehelper.openDatabaseAndPerformQueries('SELECT * FROM department'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Stack(
                        children: [
                          ListView.builder(itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {

                            if( snapshot.data[index]['department_name'].toString().toLowerCase().contains(
                            provider.textEditingController!.text.toLowerCase())) {
                              return InkWell(
                                onTap: (){
                                  provider.name = snapshot.data[index]['department_name'];
                                  provider.fac = snapshot.data[index]['department_facility'];
                                  provider.location = snapshot.data[index]['department_location'];
                                  Navigator.push(context,
                                      PageTransition(child:
                                      addmewdepatment(name: snapshot.data[index]['department_name']
                                        ,loaction: snapshot.data[index]['department_location'],
                                        fac: snapshot.data[index]['department_facility']
                                        ,update: true,id: snapshot.data[index]['department_id'].toString(),),
                                          type: PageTransitionType.fade));
                                },
                                onLongPress: (){
                                  databasehelper.deletedata(snapshot.data[index]['department_id']).then((value) {
                                    AppLayout.showsnakbar(context, "Delete Sucessfully");
                                    provider.notifyListeners();
                                  });
                                },
                                child: Container(
                                  width: AppLayout.getwidth(context),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    children: [

                                      Expanded(
                                        child: Text(
                                          snapshot.data[index]['department_name'],
                                          style:
                                          TextStyle(fontFamily: 'big',
                                              fontSize: AppLayout.getwidth(context) *
                                                  0.03),),
                                      ),

                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(snapshot
                                              .data[index]['department_location'],
                                            style:
                                            TextStyle(fontFamily: 'small',
                                                fontSize: AppLayout.getwidth(
                                                    context) * 0.03),),
                                        ),
                                      ),

                                      Expanded(
                                        child: Text(
                                          snapshot.data[index]['department_facility'],
                                          style:
                                          TextStyle(fontFamily: 'small',
                                              fontSize: AppLayout.getwidth(context) *
                                                  0.03),),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            }else{
                              return const SizedBox.shrink();
                            }
                            },
                          ),

                          Positioned(
                            bottom:10,
                              left:0,
                              right:0,
                              child: InkWell(
                                onTap:(){
                                  Navigator.push(context,
                                      PageTransition(child:
                                      addmewdepatment(name: '',loaction: '',fac: '',update: false,id: '',),
                                          type: PageTransitionType.fade));
                                },
                                child:
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width : AppLayout.getwidth(context)*0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.blue,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.add,color: Colors.white,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Text("Add",style: TextStyle(fontFamily: 'big',fontSize: AppLayout.getwidth(context)*0.05),),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const Icon(Icons.error_outline);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }




}
