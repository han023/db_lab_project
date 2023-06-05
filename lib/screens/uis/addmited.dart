import 'package:db_lab_project/dbhelper/databasehelper.dart';
import 'package:db_lab_project/helpers/top.dart';
import 'package:db_lab_project/helpers/toplables.dart';
import 'package:db_lab_project/tool/applayout.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../helpers/searchview.dart';
import '../../tool/appstate.dart';

class addmited extends StatelessWidget {
  const addmited({super.key});

  @override
  Widget build(BuildContext context) {

    AppState provider = Provider.of<AppState>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            top(title: 'Admitted'),

            const searchview(),

            toplables(lablelist: ['Name','payment mode','Advance','']),

            Expanded(
              child: FutureBuilder(
                  future: databasehelper.openDatabaseAndPerformQueries('select * from admitted join patient on admitted_id'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {

                          if( snapshot.data[index]['department_name'].toString().toLowerCase().contains(
                              provider.textEditingController!.text.toLowerCase())) {
                            return Container(
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
                                      snapshot.data[index]['patient_name'],
                                      style:
                                      TextStyle(fontFamily: 'big',
                                          fontSize: AppLayout.getwidth(context) *
                                              0.03),),
                                  ),

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0),
                                      child: Text(snapshot.data[index]['mode_of_payment'].toString()=='1'?
                                        'credit':snapshot.data[index]['mode_of_payment'].toString()=='2'?'debit':'cash',
                                        style:
                                        TextStyle(fontFamily: 'small',
                                            fontSize: AppLayout.getwidth(
                                                context) * 0.03),),
                                    ),
                                  ),


                                  Expanded(
                                    child: Text(
                                      snapshot.data[index]['adavnce_payment'].toString(),
                                      style:
                                      TextStyle(fontFamily: 'small',
                                          fontSize: AppLayout.getwidth(context) *
                                              0.03),),
                                  ),

                                ],
                              ),
                            );
                          }else{
                            return const SizedBox.shrink();
                          }
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Icon(Icons.error_outline);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }




}