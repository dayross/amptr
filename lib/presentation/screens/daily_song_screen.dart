
import 'package:amptr/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailySongScreen extends ConsumerWidget {
  const DailySongScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text("Tu canción del día es...",
            style: tituloGrandeBold,),
        SizedBox(height: size.height*0.07,),
        ClipRRect(
          child: Image.network('https://m.media-amazon.com/images/I/A1Bn8jt+wUL.jpg',
          width: size.width*0.6,),
          borderRadius: BorderRadius.circular(20),),
        SizedBox(height: size.height*0.04,),
        Text('Titulo de canción', style: tituloPequeno,),
        SizedBox(height: size.height*0.01,),
        Text('Artista de Canción', style: subtituloDos,),
        SizedBox(height: size.height*0.05,),
        FilledButton(
          style: FilledButton.styleFrom(
            fixedSize: Size(size.width*0.45, size.height*0.07)
          ),
          onPressed: (){}, 
          child: Row(children: [
            Image.asset('assets/images/icons/spotify_negro.png', width: size.width*0.08,),
            SizedBox(width: 20,),
            Text("Escuchala ya", style: subtituloDosBlanco,)
          ],))
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