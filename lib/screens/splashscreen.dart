import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../tool/applayout.dart';
import '../tool/appstate.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppState provider = Provider.of<AppState>(context,listen: false);
    provider.change_screen(context);
    copyDatabase();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text('Hospital Managment System',style: TextStyle(fontFamily: 'big',fontSize: AppLayout.getwidth(context)*0.07),
            textAlign: TextAlign.center,),

            Lottie.asset('assets/hosanim.json',width: AppLayout.getwidth(context)*0.4),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,size: AppLayout.getwidth(context)*0.03,),
                      Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Hannan : ',style: TextStyle(fontFamily: 'big',fontSize: AppLayout.getwidth(context)*0.04),
                          textAlign: TextAlign.end,),
                      ),
                      Text('562',style: TextStyle(fontFamily: 'small',fontSize: AppLayout.getwidth(context)*0.04),
                        textAlign: TextAlign.end,),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,size: AppLayout.getwidth(context)*0.03,),
                      Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('M Bilal : ',style: TextStyle(fontFamily: 'big',fontSize: AppLayout.getwidth(context)*0.04),
                          textAlign: TextAlign.end,),
                      ),
                      Text('574',style: TextStyle(fontFamily: 'small',fontSize: AppLayout.getwidth(context)*0.04),
                        textAlign: TextAlign.end,),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.circle,size: AppLayout.getwidth(context)*0.03,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('M Awais : ',style: TextStyle(fontFamily: 'big',fontSize: AppLayout.getwidth(context)*0.04),
                          textAlign: TextAlign.end,),
                      ),
                      Text('563',style: TextStyle(fontFamily: 'small',fontSize: AppLayout.getwidth(context)*0.04),
                        textAlign: TextAlign.end,),
                    ],
                  ),

                ],
              ),
            )

          ],
        ),

      ),
    );
  }

  Future<void> copyDatabase() async {
    // Get the path to the device's local storage directory
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'hospital.db');

    // Check if the database file already exists
    if (await databaseExists(path)) {
      return;
    }

    // Copy the database from assets to local storage
    ByteData data = await rootBundle.load('assets/hospital.db');
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }


}
