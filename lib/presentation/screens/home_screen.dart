

import 'package:amptr/config/config.dart';
import 'package:amptr/presentation/providers/navigation_provider.dart';
import 'package:amptr/presentation/screens/screens.dart';
import 'package:amptr/presentation/shared/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

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
        selectedItemColor: colors.primary,
        onTap: onItemTapped,
        ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: _screens[_selectedIndex],
        );
  }
}

