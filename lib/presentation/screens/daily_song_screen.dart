
import 'package:amptr/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailySongScreen extends ConsumerWidget {
  const DailySongScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Tu canción del día es...",
            style: subtituloUno,),
      ],),),
    );
  }
}

class FindOutScreen extends StatelessWidget {
  const FindOutScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 24, 24, 24),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tu canción del día es...",
            style: tituloGrandeBlanco,),
    
            SizedBox(height: size.height*0.05,),
            
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 26, 193, 85),
                fixedSize: Size(size.height*0.35, size.width*0.15)
              ),
              onPressed: (){}, 
              child: Text("Descubrelo.", style: subtituloUnoBlanco,))
          ],
        ),
      ),
    );
  }
}