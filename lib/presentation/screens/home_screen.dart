

import 'package:amptr/presentation/providers/navigation_provider.dart';
import 'package:amptr/presentation/screens/screens.dart';
import 'package:amptr/presentation/shared/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final navigationProv = ref.watch(navigationProvider);

    final screens = [
      FadeInRight(
        duration: const Duration(seconds: 1),
        child: const GreetingScreen()),
      const DailySongScreen(),
      const DailyPhotoScreen(),
      const DailyPoemScreen(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: screens[navigationProv],
    );
  }
}

