
import 'package:amptr/config/config.dart';
import 'package:amptr/presentation/providers/images/image_provider.dart';
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

    WidgetsBinding.instance.addPostFrameCallback( (_){
      if(ref.read(imageProvider).image == null){
      ref.read(imageProvider.notifier).chooseImage();
    }
    });
  }

  @override
  dispose() {
    _breathingController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imgSize = size.width*0.9 - 10 * _breathe;
    final imageProv = ref.watch(imageProvider);
    // ref.watch(imageProvider.notifier).chooseImage();

    return imageProv.loading == true 
    ? const Center(child: CircularProgressIndicator(),)
    : Scaffold(
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          const Text('Hola mundo', style: subtituloUnoBold,),
          SizedBox(
            width: imgSize,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageProv.image!)),
          ),
          FilledButton(
            onPressed: (){
              ref.watch(imageProvider.notifier).chooseImage();
            }, 
            child: const FittedBox(
              fit: BoxFit.fitWidth,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('¡Dame otra!', style: subtituloDosBlancoBold,),
              ),
            ))
        ],),),
      ),
    );
  }
}