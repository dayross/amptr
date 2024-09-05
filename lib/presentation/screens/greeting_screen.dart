

// ignore_for_file: prefer_const_constructors

import 'package:amptr/config/config.dart';
import 'package:amptr/presentation/shared/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DateTime dt = DateTime.now();
    return dt.hour < 10 
      ? _MorningScreen(size: size)
      : dt.hour < 20
        ? _EveningScreen(size: size)
        : _NightScreen(size: size);
    
    
    // return _NightScreen(size: size);
  }
}


class _NightScreen extends StatelessWidget {
  const _NightScreen({
    
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 27, 61),
      body: Stack(
        children: [
          Column(children: [
            Spacer(),
            SlideInRight(
              duration: Duration(milliseconds: 1200),
              child: SizedBox(
                height: size.height*0.55,
                width: size.width*2,
                child: ClipRRect(
                  child: CustomPaint(
                    painter: QuarterCirclePainter(CircleAlignment.bottomLeft, Colors.grey[200]!),),),
              ),
            ),
        ],),
        // Positioned(
        //   top: size.height*0.12,
        //   right: size.width*0.15,
        //   child: Transform.rotate(
        //     angle: 4, 
        //     child: SlideInRight(
        //     delay: Duration(milliseconds: 600),
        //     duration: Duration(milliseconds: 1500),
        //     child: ZoomIn(
        //       delay: Duration(milliseconds: 600),
        //       duration: Duration(milliseconds: 3000),
        //       child: Icon(Icons.rocket, color: Colors.red[600], size: 120,))))),
        Positioned(
          top: size.height*0.1,
          left: size.width*0.08,
          child: SlideInRight(
          delay: Duration(milliseconds: 600),
          duration: Duration(milliseconds: 1500),
          child: Icon(Icons.star, color: Color(0xFFFFD700), size: 32,))),
        Positioned(
          top: size.height*0.12,
          left: size.width*0.3,
          child: SlideInRight(
          delay: Duration(milliseconds: 600),
          duration: Duration(milliseconds: 1500),
          child: Icon(Icons.star, color: Color(0xFFFFD700), size: 32,))),
        Positioned(
          top: size.height*0.15,
          right: size.width*0.4,
          child: SlideInRight(
          delay: Duration(milliseconds: 600),
          duration: Duration(milliseconds: 1500),
          child: Icon(Icons.star, color: Color(0xFFFFD700), size: 32,))),
        Positioned(
          top: size.height*0.21,
          right: size.width*0.2,
          child: SlideInRight(
          delay: Duration(milliseconds: 600),
          duration: Duration(milliseconds: 1500),
          child: Icon(Icons.star, color: Color(0xFFFFD700), size: 32,))),
        Positioned(
          top: size.height*0.28,
          right: size.width*0.02,
          child: SlideInRight(
          delay: Duration(milliseconds: 600),
          duration: Duration(milliseconds: 1500),
          child: Icon(Icons.star, color: Color(0xFFFFD700), size: 32,))),
        Positioned(
          top: size.height*0.34,
          right: size.width*0.36,
          child: SlideInRight(
          delay: Duration(milliseconds: 600),
          duration: Duration(milliseconds: 1500),
          child: Icon(Icons.star, color: Color(0xFFFFD700), size: 32,))),
        Positioned(
         top: size.height*0.27,
          left: size.width*0.25,
          child: SlideInRight(
          delay: Duration(milliseconds: 600),
          duration: Duration(milliseconds: 1500),
          child: Icon(Icons.star, color: Color(0xFFFFD700), size: 32,))),
        Positioned(
          bottom: size.height*0.38,
          left: size.width*0.07,
          child: FadeIn(
            delay: Duration(milliseconds: 1000),
            duration: Duration(milliseconds: 1000),
            child: Icon(Icons.circle, color: Colors.grey, size: 84))),
        Positioned(
          bottom: size.height*0.22,
          right: size.width*0.13,
          child: FadeIn(
            delay: Duration(milliseconds: 1000),
            duration: Duration(milliseconds: 1000),
            child: Icon(Icons.circle, color: Colors.grey, size: 64))),
        Positioned(
          bottom: size.height*0.15,
          left: size.width*0.2,
          child: FadeIn(
            delay: Duration(milliseconds: 1000),
            duration: Duration(milliseconds: 1000),
            child: Icon(Icons.circle, color: Colors.grey, size: 56))),
        Positioned(
          bottom: size.height*0.31,
          left: size.width*0.43,
          child: FadeIn(
            delay: Duration(milliseconds: 1000),
            duration: Duration(milliseconds: 1000),
            child: Icon(Icons.circle, color: Colors.grey, size: 42))),
        Positioned(
          bottom: size.height*0.28,
          left: size.width*0.05,
          child: SlideInRight(
            delay: Duration(milliseconds: 600),
            duration: Duration(milliseconds: 1500),
            child: FadeIn(
              delay: Duration(milliseconds: 600),
              duration: Duration(milliseconds: 1000),
              child: SizedBox(
                  width: size.width*0.75,
                  height: size.height*0.2,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text("Buenas noches", style: TextStyle(fontWeight: FontWeight.bold),)),)))),
          
          ]
      ),
    );
  }
}

class _EveningScreen extends StatelessWidget {
  const _EveningScreen({
    
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[300],
        body: Stack(
          children: [
            Column(children: [
              Spacer(),
              SlideInRight(
                duration: Duration(milliseconds: 1200),
                child: SizedBox(
                  height: size.height*0.55,
                  width: size.width*2,
                  child: ClipRRect(
                    child: CustomPaint(
                      painter: QuarterCirclePainter(CircleAlignment.bottomLeft, Color(0xFF81C784)),),),
                ),
              ),
          ],),
          Positioned(
            bottom: size.height*0.12,
            right: size.width*0.2,
            child: SpinPerfect(
              spins: 4,
              duration: Duration(milliseconds: 2000),
              child: Icon(Icons.filter_vintage_rounded, color: Color(0xFFFFD700), size: size.width*0.18,))),
          Positioned(
            bottom: size.height*0.2,
            left: size.width*0.15,
            child: SpinPerfect(
              spins: 4,
              duration: Duration(milliseconds: 2000),
              child: Icon(Icons.filter_vintage, color: Color.fromARGB(255, 233, 105, 1), size: size.width*0.2,))),
          Positioned(
            bottom: size.height*0.3,
            right: size.width*0.4,
            child: SpinPerfect(
              spins: 4,
              duration: Duration(milliseconds: 2000),
              child: Icon(Icons.filter_vintage, color: Colors.pinkAccent, size: size.width*0.15,))),
          Positioned(
            bottom: size.height*0.4,
            left: size.width*0.17,
            child: FadeIn(
              delay: Duration(milliseconds: 600),
              duration: Duration(milliseconds: 1000),
              child: Icon(Icons.eco, color: Color(0xFF43A047), size: size.width*0.16,))),
          Positioned(
            top: size.height*0.15,
            right: size.width*0.17,
            child: FadeIn(
              delay: Duration(milliseconds: 600),
              duration: Duration(milliseconds: 1000),
              child: Icon(Icons.cloud, color: Colors.white70, size: size.width*0.3,))),
            
            Positioned(
            bottom: size.height*0.28,
            left: size.width*0.05,
            child: SlideInRight(
              delay: Duration(milliseconds: 600),
              duration: Duration(milliseconds: 1500),
              child: FadeIn(
                delay: Duration(milliseconds: 600),
                duration: Duration(milliseconds: 1000),
                child: SizedBox(
                  width: size.width*0.75,
                  height: size.height*0.2,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text("Buenas tardes", style: TextStyle(fontWeight: FontWeight.bold),)))))),
            ]
        ),
      ),
    );
  }
}

class _MorningScreen extends StatelessWidget {
  const _MorningScreen({
    
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF87CEEB),
      body: Stack(
        children: [
          Column(children: [
            Spacer(),
            SlideInRight(
              duration: Duration(milliseconds: 1200),
              child: SizedBox(
                height: size.height*0.55,
                width: size.width*2,
                child: ClipRRect(
                  child: CustomPaint(
                    painter: QuarterCirclePainter(CircleAlignment.bottomLeft, Color(0xFFFFFACD)),),),
              ),
            ),
        ],),
        Positioned(
          bottom: size.height*0.28,
          left: size.width*0.05,
          child: SlideInRight(
            delay: Duration(milliseconds: 600),
            duration: Duration(milliseconds: 1500),
            child: FadeIn(
              delay: Duration(milliseconds: 600),
              duration: Duration(milliseconds: 1000),
              child: SizedBox(
                  width: size.width*0.75,
                  height: size.height*0.2,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text("Buenos dias", style: TextStyle(fontWeight: FontWeight.bold),)),)))),
        Positioned(
          top: size.height*0.15,
          right: size.width*0.15,
          child: Transform.rotate(
            angle: 60, 
            child: SpinPerfect(
              spins: 4,
              duration: Duration(milliseconds: 2000),
              child: Icon(Icons.star, color: Color(0xFFFFB6C1), size: 64,))))
          ]
      ),
    );
  }
}
