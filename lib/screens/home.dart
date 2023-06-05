import 'package:db_lab_project/helpers/bottomcontainer.dart';
import 'package:db_lab_project/screens/uis/addmited.dart';
import 'package:db_lab_project/screens/uis/billing.dart';
import 'package:db_lab_project/screens/uis/callondoctor.dart';
import 'package:db_lab_project/screens/uis/checkup.dart';
import 'package:db_lab_project/screens/uis/department.dart';
import 'package:db_lab_project/screens/uis/dischatge.dart';
import 'package:db_lab_project/screens/uis/doctor.dart';
import 'package:db_lab_project/screens/uis/indoorpatient.dart';
import 'package:db_lab_project/screens/uis/medicine.dart';
import 'package:db_lab_project/screens/uis/nurse.dart';
import 'package:db_lab_project/screens/uis/outdoorpatient.dart';
import 'package:db_lab_project/screens/uis/patient.dart';
import 'package:db_lab_project/screens/uis/room.dart';
import 'package:db_lab_project/screens/uis/staff.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';


import '../helpers/maincontainer.dart';
import '../tool/applayout.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome ...',style: TextStyle(fontFamily: 'big',fontSize: AppLayout.getwidth(context)*0.07),),
                        Text('Hospital Managment System',style: TextStyle(fontFamily: 'small',fontSize: AppLayout.getwidth(context)*0.035),),
                      ],
                    ),
                    Image.asset('assets/avatar.png',width: AppLayout.getwidth(context)*0.15,
                      height: AppLayout.getwidth(context)*0.15,),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    maincontainer(text: 'Deparment',ani: 'assets/dep.png',widget: const depatment(),),
                    maincontainer(text: 'Patent',ani: 'assets/pat.png',widget: const patient(),),
                    maincontainer(text: 'Room',ani: 'assets/room.png',widget: const rooms(),),
                    maincontainer(text: 'Attmited',ani: 'assets/att.png',widget: const addmited(),),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0,left: 8,right: 8,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    maincontainer(text: 'Billing',ani: 'assets/bill.png',widget: const Billing(),),
                    maincontainer(text: 'Checkup',ani: 'assets/check.png',widget: const checkup(),),
                    maincontainer(text: 'Discharge',ani: 'assets/dis.png',widget: const discharge(),),
                    maincontainer(text: 'Doctor',ani: 'assets/doc.png',widget: const doctor(),),
                  ],
                ),
              ),

                    bottomcontainer(text: 'medicine', col: Colors.blue,widget: const medicine(),),
                    bottomcontainer(text: 'nurse', col: Colors.amber,widget: const nurse(),),
                    bottomcontainer(text: 'staff', col: Colors.green,widget: const staff(),),
                    bottomcontainer(text: 'outdoor patient', col: Colors.grey,widget: const outdoor_patient(),),
                    bottomcontainer(text: 'doctor on call', col: Colors.deepPurple,widget: const call_on_doctor(),),
                    bottomcontainer(text: 'indoor patient', col: Colors.red,widget: const indoor_patient(),),

            ],
          ),
        ),
      ),
    );
  }
}

