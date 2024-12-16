

import 'package:amptr/presentation/screens/screens.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {

  int _selectedIndex = 0;
  static final List<Widget> _screens = <Widget>[
      FadeInRight(
          duration: const Duration(seconds: 1),
          child: const GreetingScreen()),
        const DailySongScreen(),
        const DailyPhotoScreen(),
        const DailyPoemScreen(),
    ];

    void onItemTapped(int index){
      setState(() {
        _selectedIndex = index;
      });
    }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // ignore: unused_local_variable
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
           label: 'Inicio'),
           
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
             label: 'Canción'),

          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
             label: 'Foto'),

          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet_rounded),
             label: 'Poema'),           
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: onItemTapped,
        ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: _screens[_selectedIndex],
        );
  }
}

