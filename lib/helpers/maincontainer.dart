import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/animation_builder/loop_animation_builder.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

import '../tool/applayout.dart';
import '../tool/appstate.dart';

class maincontainer extends StatelessWidget {

  maincontainer({Key? key,required this.text,required this.ani,this.widget}) : super(key: key);
  final String text,ani;
  Widget? widget;

  @override
  Widget build(BuildContext context) {

    final tween = MovieTween()
      ..scene(
          begin: const Duration(milliseconds: 0),
          end: const Duration(milliseconds: 2500))
          .tween('y', Tween(begin: 100.0, end: 0.0),curve: Curves.easeIn )
      ..scene(
          begin: const Duration(milliseconds: 1500),
          end: const Duration(milliseconds: 3000))
          .tween('op', Tween(begin: 0.0, end: 1.0),curve: Curves.easeIn);

    AppState provider = Provider.of<AppState>(context,listen: false);

    return PlayAnimationBuilder<Movie>(
        tween: tween, // Pass in tween
        duration: tween.duration, // Obtain duration
        builder: (context, value, child) {
          return
            Transform.translate(
              offset: Offset(0, value.get('y')),
              child: Opacity(
                opacity: value.get('op'),
                child: InkWell(
                onTap: () {
                  provider.textEditingController?.clear();
                  provider.name = provider.location = provider.fac = '';
                  if (widget != null) {
                    Navigator.push(context,
                        PageTransition(child: widget!, type: PageTransitionType.fade));
                  }
                },
                child: Container(
                  width: AppLayout.getwidth(context) * 0.22,
                  height: AppLayout.getheight(context) * 0.17,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ani, height: 60,),
                      Text(text.toUpperCase(),
                        style: TextStyle(fontSize: AppLayout.getwidth(context) * 0.032,
                          fontFamily: "big",),
                        maxLines: 2, textAlign: TextAlign.center,)
                    ],),
                ),
            ),
              ),
          );
        }
    );
  }
}


