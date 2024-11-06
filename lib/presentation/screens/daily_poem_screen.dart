

import 'package:amptr/config/config.dart';
import 'package:amptr/presentation/providers/poems/poem_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class DailyPoemScreen extends ConsumerStatefulWidget {
  const DailyPoemScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DailyPoemScreenState();
}

class _DailyPoemScreenState extends ConsumerState<DailyPoemScreen> {

  @override
  void initState() {

      WidgetsBinding.instance.addPostFrameCallback( (_){
      if(ref.read(poemasProvider).poema == null){
      ref.read(poemasProvider.notifier).getRandom();
    }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final poemProv = ref.watch(poemasProvider);
    return poemProv.loading == true 
    ? const Center(child: CircularProgressIndicator(),)
    : Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(size.width*0.05, size.width*0.1, size.width*0.05, size.height*0.07 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text("Y para ti... un ${poemProv.poema?.tipo}", style: tituloPequenoBold, textAlign: TextAlign.start,),
          SizedBox(height: size.height*0.04,),
          Text(poemProv.poema?.contenido.nombre == ""
          ? ""
          : '"${poemProv.poema?.contenido.nombre}"', style: subtituloUno.copyWith(fontSize: 24, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Container(
            width: size.width*0.9,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 239, 244, 233),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15, 
                vertical: 25), 
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(poemProv.poema?.contenido.contenido ?? "",
                          style: subtitulotresBold,),
                    const SizedBox(height: 30,),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(poemProv.poema?.contenido.autor ?? "", style: subtitulotres, textAlign: TextAlign.right, ))
                  ],
                ),
              ),),
          ),
          SizedBox(height: size.height*0.03,),
          FilledButton.tonal(
            onPressed: ref.watch(poemasProvider.notifier).getRandom, 
            child: const Text("Quiero otro.", style: subtitulotresBold,))
        ],),),
    );
  }
}



// /**
//  * 
//  * PoemasAPI: 150.136.49.236
//  */
// class DailyPoemScreen extends ConsumerStatefulWidget {
//   const DailyPoemScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final size = MediaQuery.of(context).size;

//     final poemProv = ref.watch(poemasProvider);
    
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: (size.width*0.04), vertical: (size.height*0.012)),
//         // padding: EdgeInsets.fromLTRB(size.width*0.02, size.height*0.007, size.width*0.02, size.height*0.1),
//         child: Stack(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: size.height*0.05,),
//                 Text("Y para ti... un")
//                 FittedBox(
//                   fit: BoxFit.fill,
//                   child: Container(
//                     height: size.height,
//                     width: size.width,
//                     color: Colors.red,),
//                 )
//             ],
//           ),
//           Positioned(
//             bottom: 1,
//             child: Container(
//               color: Colors.blue,
//               height: size.height*0.07,
//               width: size.width,
//             ))]
//         ),
//       ),
//     );

//     // return Scaffold(
//     //   body: SingleChildScrollView(
//     //     child: Padding(
//     //       padding: EdgeInsets.symmetric(horizontal: (size.width*0.04), vertical: (size.height*0.015)),
//     //       child: DecoratedBox(
//     //         decoration: BoxDecoration(
//     //           image: DecorationImage(
//     //             image: AssetImage('assets/images/flores.png'),
//     //             fit: BoxFit.fitHeight),
//     //         ),
            
//     //         child: Column(
//     //           mainAxisAlignment: MainAxisAlignment.center,
//     //           crossAxisAlignment: CrossAxisAlignment.start,
//     //           children: [
//     //             Text('titulo', style: tituloGrandeBold,),
//     //             Text('''Lorem ipsum odor amet, consectetuer adipiscing elit. 
//     //             Egestas tempor sollicitudin tellus consectetur conubia 
//     //             quisque ornare. Ut molestie ullamcorper mollis malesuada 
//     //             risus ipsum commodo nullam. Ligula bibendum ultrices 
//     //             parturient in suscipit tellus consequat. Class primis 
//     //             mollis luctus donec porttitor quisque quis convallis. 
//     //             Curabitur placerat sed ac fames, lectus nostra blandit 
//     //             aptent. Velit sodales ornare in consequat dignissim magna. 
//     //             Sodales nostra tincidunt aenean ipsum sed ac. 
//     //             Efficitur turpis nibh habitant egestas scelerisque dictum. 
//     //             Ornare nisl phasellus et risus eu bibendum. 
//     //             Lectus habitasse accumsan ridiculus vel ultrices rutrum 
//     //             fringilla. Sollicitudin potenti arcu fermentum vivamus primis 
//     //             ullamcorper curae.''', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),),
//     //           ],
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }