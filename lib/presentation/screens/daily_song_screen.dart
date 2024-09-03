
import 'dart:math';

import 'package:amptr/config/config.dart';
import 'package:amptr/presentation/providers/music/song_provider.dart';
import 'package:confetti/confetti.dart';
import 'package:easy_url_launcher/easy_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailySongScreen extends ConsumerWidget {
  const DailySongScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return  const FindOutScreen();
  }
}

class TrackScreen extends ConsumerStatefulWidget {
  const TrackScreen({
    super.key,
    
  });

  

  @override
  _TrackScreenState createState() => _TrackScreenState();
}

class _TrackScreenState extends ConsumerState<TrackScreen> {

  late ConfettiController _confettiCont;

  @override
  void initState() {
    _confettiCont = ConfettiController(duration: const Duration(milliseconds: 800));
    ref.read(trackProvider);
  }
  @override
  Widget build(BuildContext context) {
    final trackProv = ref.watch(trackProvider);
    final size = MediaQuery.of(context).size;
    _confettiCont.play();
    
    return Scaffold(
      body: Center(child: Stack(
        children: [
          Positioned(
            top: 1,
            left: size.width*0.5,
            height: 1,
          child: ConfettiWidget(
            confettiController: _confettiCont,
            blastDirection: -pi /2,
            emissionFrequency: 0.2,
            numberOfParticles: 15,
            blastDirectionality: BlastDirectionality.explosive,
            ),
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text("Tu canción del día es...",
              style: tituloGrandeBold,
              textAlign: TextAlign.center,),
          SizedBox(height: size.height*0.06,),
          ClipRRect(
            child: Image.network(trackProv.song!.album.images[0].url,
            width: size.width*0.6,),
            borderRadius: BorderRadius.circular(20),),
          SizedBox(height: size.height*0.04,),
          Text(trackProv.song!.name, style: tituloPequenoBold,),
          SizedBox(height: size.height*0.01,),
          Text(trackProv.song!.artists[0].name ?? '', style: subtituloDosBold,),
          SizedBox(height: size.height*0.05,),
          FilledButton(
            style: FilledButton.styleFrom(
              fixedSize: Size(size.width*0.5, size.height*0.07)
            ),
            onPressed: () async{
              await EasyLauncher.url(
                url: trackProv.song!.externalUrls.spotify);
            }, 
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Image.asset('assets/images/icons/spotify_blanco.png', width: size.width*0.08,),
                SizedBox(width: size.width*0.06,),
                const Text("Escuchala ya", style: subtituloDosBlancoBold,)
              ],),
            ))
        ],),
        ]
      ),),
    );
  }
}

class FindOutScreen extends ConsumerWidget {
  const FindOutScreen({
    super.key,
    
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final trackProv = ref.watch(trackProvider);
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: const Color.fromARGB(235, 24, 24, 24),
      body: Center(
        child: trackProv.loading == true ?
        const CircularProgressIndicator()
        : trackProv.song != null 
        ? const TrackScreen()
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("¿Qué vamos a escuchar hoy?",
            style: tituloGrandeBlancoBold,
            textAlign: TextAlign.center,),
    
            SizedBox(height: size.height*0.05,),
            
            FilledButton.tonal(
              style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 26, 193, 85),
                fixedSize: Size(size.height*0.35, size.width*0.15)
              ),
              onPressed: (){
                // ref.watch(trackProvider.notifier).getToken();
                ref.watch(trackProvider.notifier).chooseTrack();
                
                // if (trackProv.playlist != null){
                //   Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //   fullscreenDialog: true,
                //   builder: (context){
                //     return const TrackScreen();
                //   }));
                // }
              }, 
              child: const Text("Descubrelo.", style: subtituloUnoBlanco,))
          ],
        ),
      ),
    );
  }
}