
import 'dart:math';

import 'package:amptr/config/config.dart';
import 'package:amptr/presentation/providers/music/song_provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:confetti/confetti.dart';
import 'package:url_launcher/url_launcher.dart';
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.07),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // SizedBox(height: size.height*0.1),
            SizedBox(
              height: size.height*0.1,
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text("Tu canción del día es...",
                    style: tituloGrandeBold,
                    textAlign: TextAlign.center,),
              ),
            ),
            SizedBox(height: size.height*0.06,),
            ClipRRect(
              child: Image.network(trackProv.song!.album.images[0].url,
              width: size.width*0.6,),
              borderRadius: BorderRadius.circular(20),),
            SizedBox(height: size.height*0.04,),
            SizedBox(
              height: size.height*0.05,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(trackProv.song!.name, style: tituloPequenoBold,))),
            SizedBox(height: size.height*0.01,),
            Text(trackProv.song!.artists[0].name ?? '', style: subtituloDosBold,),
            SizedBox(height: size.height*0.05,),
            FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(size.width*0.5, size.height*0.07)
              ),
              onPressed: () async{
                final spotifyUrl = Uri.parse(trackProv.song!.externalUrls.spotify);
                if (await canLaunchUrl(spotifyUrl)){
                  launchUrl(spotifyUrl, mode: LaunchMode.externalApplication);
                }
              
               }, 
              child: Row(children: [
                Image.asset('assets/images/icons/spotify_blanco.png', width: size.width*0.08,),
                SizedBox(width: size.width*0.05,),
                SizedBox(
                  width: size.width*0.23,
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text("Escuchala ya", style: subtituloDosBlancoBold,)),
                )
              ],))
                    ],),
          ),
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
        : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("¿Qué vamos a escuchar hoy?",
              style: tituloGrandeBlancoBold,
              textAlign: TextAlign.center,),
              
              SizedBox(height: size.height*0.05,),
              
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 26, 193, 85),
                  fixedSize: Size(size.width*0.5, size.height*0.08)
                ),
                onPressed: (){
                  ref.watch(trackProvider.notifier).chooseTrack();
                }, 
                child:const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("Descubrelo.", style: subtituloUnoBlanco,)))
            ],
          ),
        ),
      ),
    );
  }
}