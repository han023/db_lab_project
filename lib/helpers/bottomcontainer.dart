import 'package:db_lab_project/tool/applayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class bottomcontainer extends StatelessWidget {
  bottomcontainer({super.key,required this.text,this.widget,required this.col});
  final String text;
  Widget? widget;
  Color col;

  @override
  Widget build(BuildContext context) {

    final tween = MovieTween()
      ..scene(
          begin: const Duration(milliseconds: 0),
          end: const Duration(milliseconds: 2500))
          .tween('y', Tween(begin: 500.0, end: 0.0),curve: Curves.easeIn )
      ..scene(
          begin: const Duration(milliseconds: 1500),
          end: const Duration(milliseconds: 3000))
          .tween('op', Tween(begin: 0.0, end: 1.0),curve: Curves.easeIn);


    return PlayAnimationBuilder<Movie>(
        tween: tween, // Pass in tween
        duration: tween.duration, // Obtain duration
        builder: (context, value, child) {
          return
            Transform.translate(
              offset: Offset(value.get('y'),0),
              child: Opacity(
                opacity: value.get('op'),
                child: InkWell(
                onTap: (){
                  if (widget != null) {
                    Navigator.push(context,
                        PageTransition(child: widget!, type: PageTransitionType.fade));
                  }
                },
                child: Container(
                  width: AppLayout.getwidth(context),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:  Colors.blue.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                        width: 1,
                        color: col.withOpacity(0.1)
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [
                          const Icon(Icons.person),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              text,style: TextStyle(fontFamily: 'big',fontSize: AppLayout.getwidth(context)*0.04),
                            ),
                          ),
                        ],
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.arrow_forward_ios),
                      ),


                    ],
                  ),
                 ),
                ),
              ),
            );
        }

    );
  }
}
