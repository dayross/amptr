


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
      // extendBody: true,
      backgroundColor: const Color.fromARGB(255, 31, 27, 61),
      body: Stack(
        children: [
          Column(children: [
            const Spacer(),
            SlideInRight(
              duration: const Duration(milliseconds: 1200),
              child: Container(
                height: size.height*0.32,
                width: size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.width*0.4),
                    topRight: Radius.circular(size.width*0.4),
                  )
                ),),
            ),
        ],),
        Positioned(
          bottom: size.height*0.27,
          left: 0,
          right: 0,
          child: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(Icons.park, color: Colors.green[800], size: size.height*0.4,),],))),
        Positioned(
          bottom: size.height*0.288,
          left: 0,
          right: 0,
          child: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(Icons.square, color: Colors.brown[900], size: size.height*0.095,),],))),
        // esferas
        Positioned(
          top: size.height*0.5,
          left: size.width*0.34,
          child: SlideInDown(
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.circle, color: Colors.red[600], size: 24,))),
        Positioned(
          top: size.height*0.43,
          left: size.width*0.5,
          child: SlideInDown(
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.circle, color: Colors.blue[600], size: 24,))),
        Positioned(
          top: size.height*0.57,
          right: size.width*0.33,
          child: SlideInDown(
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.circle, color: Colors.yellow[600], size: 24,))),
        Positioned(
          top: size.height*0.58,
          left: size.width*0.33,
          child: SlideInDown(
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.circle, color: Colors.purple[300], size: 24,))),
        Positioned(
          top: size.height*0.53,
          right: size.width*0.43,
          child: SlideInDown(
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.circle, color: Colors.cyan[600], size: 24,))),
        //snowflakes
        Positioned(
          top: size.height*0.1,
          left: size.width*0.08,
          child: SlideInDown(
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.ac_unit, color: Colors.blue[50], size: 32,))),
        Positioned(
          top: size.height*0.12,
          left: size.width*0.3,
          child: SlideInDown(
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.ac_unit, color: Colors.blue[50], size: 32,))),
        Positioned(
          top: size.height*0.15,
          right: size.width*0.4,
          child: SlideInDown(
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.ac_unit, color: Colors.blue[50], size: 32,))),
        Positioned(
          top: size.height*0.21,
          right: size.width*0.2,
          child: SlideInDown(
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.ac_unit, color: Colors.blue[50], size: 32,))),
        Positioned(
          top: size.height*0.28,
          right: size.width*0.02,
          child: SlideInDown(
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.ac_unit, color: Colors.blue[50], size: 32,))),
        Positioned(
          top: size.height*0.25,
          right: size.width*0.4,
          child: SlideInDown(
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.ac_unit, color: Colors.blue[50], size: 32,))),
        Positioned(
          top: size.height*0.42,
          left: size.width*0.12,
          child: SlideInDown(
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.ac_unit, color: Colors.blue[50], size: 32,))),
        Positioned(
          top: size.height*0.36,
          right: size.width*0.22,
          child: SlideInDown(
          duration: const Duration(milliseconds: 1500),
          child: Icon(Icons.ac_unit, color: Colors.blue[50], size: 32,))),
          Positioned(
         top: size.height*0.27,
          left: size.width*0.25,
          child: SlideInDown(
          duration: const Duration(milliseconds: 1500),
          child:  Icon(Icons.ac_unit, color: Colors.blue[50], size: 32,))),
        // esrtella de belen
        Positioned(
          top: size.height*0.07,
          right: size.width*0.1,
          child: Pulse(
            infinite: true,
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 1500),
          child: const Icon(Icons.star, color: Color(0xFFFFD700), size: 56,))),
        // estrella del pino
        Positioned(
          top: size.height*0.32,
          right: 0,
          left: 0,
          child: BounceInDown(
          from: 200,
          delay: const Duration(milliseconds: 600),
          duration: const Duration(milliseconds: 1500),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 72,),
            ],
          ))),        
        Positioned(
          bottom: size.height*0.05,
          left: 0,
          right: 0,
          child: SlideInRight(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(milliseconds: 1500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                  delay: const Duration(milliseconds: 600),
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox(
                      width: size.width*0.75,
                      height: size.height*0.2,
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text("Buenas noches", style: TextStyle(fontWeight: FontWeight.bold,),)),)),],))),]
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
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Stack(
        children: [
          Column(children: [
            const Spacer(),
            SlideInRight(
              duration: const Duration(milliseconds: 1200),
              child: SizedBox(
                height: size.height*0.55,
                width: size.width*2,
                child: const ClipRRect(
                  child: CustomPaint(
                    painter: QuarterCirclePainter(CircleAlignment.bottomLeft, Color(0xFF81C784)),),),
              ),
            ),
        ],),
          Positioned(
          bottom: size.height*0.05,
          // left: size.width*0.12,
          left: 0,
          right: 0,
          child: SlideInRight(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(milliseconds: 1500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                  delay: const Duration(milliseconds: 600),
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox(
                      width: size.width*0.75,
                      height: size.height*0.2,
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text("Buenas tardes", style: TextStyle(fontWeight: FontWeight.bold,),)),)),],))),
          Positioned(
            top: size.height*0.15,
            right: size.width*0.17,
            child: FadeIn(
              delay: const Duration(milliseconds: 600),
              duration: const Duration(milliseconds: 1000),
              child: Icon(Icons.cloud, color: Colors.white70, size: size.width*0.3,))),
          Positioned(
          bottom: size.height*0.35,
          left: -size.width*0.3,
          child: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Icon(Icons.park, color: Colors.green[600], size: size.height*0.4,))),
        Positioned(
          bottom: size.height*0.364,
          left: size.width*0.012,
          child: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Icon(Icons.square, color: Colors.brown[500], size: size.height*0.1,))),
          Positioned(
          bottom: size.height*0.27,
          left: 0,
          right: 0,
          child: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(Icons.park, color: Colors.green[700], size: size.height*0.4,),],))),
        Positioned(
          bottom: size.height*0.29,
          left: 0,
          right: 0,
          child: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(Icons.square, color: Colors.brown[800], size: size.height*0.095,),],))),
        Positioned(
          bottom: size.height*0.4,
          left: size.width*0.34,
          child: BounceInDown(
            from: 200,
            duration: const Duration(milliseconds: 2000),
            child: const Icon(Icons.circle, color: Colors.red, size: 24,))),
        Positioned(
          bottom: size.height*0.45,
          left: size.width*0.57,
          child: BounceInDown(
            from: 200,
            duration: const Duration(milliseconds: 2000),
            child: const Icon(Icons.circle, color: Colors.yellow, size: 24,))),
        Positioned(
          bottom: size.height*0.51,
          left: size.width*0.43,
          child: BounceInDown(
            from: 200,
            duration: const Duration(milliseconds: 2000),
            child: const Icon(Icons.circle, color: Colors.blue, size: 24,))),
          
          
          ]
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
      backgroundColor: const Color(0xFF87CEEB),
      body: Stack(
        children: [
          Column(children: [
            const Spacer(),
            SlideInRight(
              duration: const Duration(milliseconds: 1200),
              child: Container(
                height: size.height*0.32,
                width: size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green[800],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.width*0.35),
                    topRight: Radius.circular(size.width*0.35),
                  )
                ),),
              // child: SizedBox(
              //   height: size.height*0.3,
              //   width: size.width*2,
              //   child: const ClipRRect(
              //     child: CustomPaint(
              //       painter: QuarterCirclePainter(CircleAlignment.bottom, Color(0xFFFFFACD)),),),
              // ),
            ),
        ],),
        Positioned(
          bottom: size.height*0.05,
          // left: size.width*0.12,
          left: 0,
          right: 0,
          child: SlideInRight(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(milliseconds: 1500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                  delay: const Duration(milliseconds: 600),
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox(
                      width: size.width*0.75,
                      height: size.height*0.2,
                      child: const FittedBox(
                        fit: BoxFit.contain,
                        child: Text("Buenos dias", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),)),
              ],
            ))),
        Positioned(
          bottom: size.height*0.27,
          left: 0,
          right: 0,
          child: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(Icons.park, color: Colors.green, size: size.height*0.4,),],))),
        Positioned(
          bottom: size.height*0.29,
          left: 0,
          right: 0,
          child: FadeIn(
            duration: const Duration(milliseconds: 2000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(Icons.square, color: Colors.brown[800], size: size.height*0.095,),],))),
        Positioned(
          top: size.height*0.15,
          right: size.width*0.15,
          child: Transform.rotate(
            angle: 60, 
            child: SpinPerfect(
              spins: 4,
              duration: const Duration(milliseconds: 2000),
              child: const Icon(Icons.star, color: Color(0xFFFFB6C1), size: 64,)))),
        Positioned(
          bottom: size.height*0.4,
          left: size.width*0.34,
          child: BounceInDown(
            from: 200,
            duration: const Duration(milliseconds: 2000),
            child: Icon(Icons.circle, color: Colors.red[700], size: 24,))),
        Positioned(
          bottom: size.height*0.45,
          left: size.width*0.57,
          child: BounceInDown(
            from: 200,
            duration: const Duration(milliseconds: 2000),
            child: Icon(Icons.circle, color: Colors.yellow[700], size: 24,))),
        Positioned(
          bottom: size.height*0.51,
          left: size.width*0.43,
          child: BounceInDown(
            from: 200,
            duration: const Duration(milliseconds: 2000),
            child: Icon(Icons.circle, color: Colors.blue[700], size: 24,))),
          ]
      ),
    );
  }
}
