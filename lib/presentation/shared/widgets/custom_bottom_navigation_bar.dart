

import 'package:amptr/presentation/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationProv = ref.watch(navigationProvider);

    return BottomNavigationBar(
      elevation: 0.0,
      backgroundColor: Colors.lightBlue,
      // type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black54,
      selectedItemColor: const Color.fromARGB(255, 46, 38, 211),
      currentIndex: navigationProv,
      onTap: (value)=> ref
        .watch(navigationProvider.notifier)
        .update( (state)=> value),
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
        );
  }
}