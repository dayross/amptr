

// ignore_for_file: prefer_const_constructors

import 'package:amptr/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snow_fall_animation/snow_fall_animation.dart';

class ButtonScreen extends ConsumerWidget {
  const ButtonScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref,) {
    final size = MediaQuery.of(context).size;
    final DateTime dt = DateTime.now();
    

    return Scaffold(
      extendBody: true,
      backgroundColor:  const Color.fromRGBO(57, 129, 78, 1),
      body: Center(
        child: Stack(
          children: [
            SnowFallAnimation(
              
            ),
            Center(
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),),
                  fixedSize: Size(size.width*0.4, size.height*0.07),
                  backgroundColor: const Color.fromRGBO(197, 76, 71, 1)
                ),
                // onPressed: ()=> ref.watch(homeScreenProvider.notifier).state = true,
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context){
                      return const HomeScreen();
                  }));
                },
                label: Icon( dt.hour < 10 
                  ? Icons.wb_cloudy_rounded 
                  : dt.hour < 20
                    ? Icons.wb_sunny_rounded
                    : Icons.nights_stay
                    , color: Colors.white, size: size.height*0.04,)
                    ),
            ),]
        ),
      ),
    );
  }
}

