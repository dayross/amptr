

import 'package:amptr/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonScreen extends ConsumerWidget {
  const ButtonScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref,) {
    final size = MediaQuery.of(context).size;
    final DateTime dt = DateTime.now();
    

    return Scaffold(
      // extendBody: true,
      // backgroundColor:  Color.fromARGB(255, 127, 156, 117),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),),
                fixedSize: Size(size.width*0.4, size.height*0.07),
                backgroundColor: Color.fromARGB(255, 40, 55, 35)
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
                  , color: Colors.amber, size: size.height*0.04,)
                  )
          ]
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), label: "Hola"),
      //     BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), label: "Hola"),
      //     BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined), label: "Hola"),
      //   ]),
    );
  }
}

