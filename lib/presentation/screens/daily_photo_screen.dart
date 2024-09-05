
import 'package:amptr/config/config.dart';
import 'package:amptr/presentation/providers/images/image_provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyPhotoScreen extends ConsumerStatefulWidget {
  const DailyPhotoScreen({super.key});

  @override
  DailyPhotoScreenState createState() => DailyPhotoScreenState();
}

class DailyPhotoScreenState extends ConsumerState<DailyPhotoScreen> with TickerProviderStateMixin{

  late AnimationController _breathingController;
  var _breathe = 0.0;

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
      vsync: this, duration: const Duration(seconds: 1));
    _breathingController.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _breathingController.reverse();
      } else if(status == AnimationStatus.dismissed){
        _breathingController.forward();
      }
    });

    _breathingController.addListener( (){
      setState(() {
        _breathe = _breathingController.value;
      });
    });
    _breathingController.forward();
      
    // ref.read(imageProvider);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final imgSize = size.width*0.9  * _breathe;
    final imgSize = size.width*0.9 - 10 * _breathe;
    // print(_breathe);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          const Text('Hola mundo', style: subtituloDosBold,),
          SizedBox(
            width: imgSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network('https://images.twinkl.co.uk/tw1n/image/private/t_630/u/ux/horizontal-wiki_ver_1.png')),
          ),
          // FilledButton(onPressed: onPressed, child: child)

          
        ],),),
      ),
    );
  }
}