
import 'package:amptr/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyPoemScreen extends ConsumerWidget {
  const DailyPoemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (size.width*0.04), vertical: (size.height*0.015)),
        // padding: EdgeInsets.fromLTRB(size.width*0.02, size.height*0.007, size.width*0.02, size.height*0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.red,),
            )
          ],
        ),
      ),
    );

    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: (size.width*0.04), vertical: (size.height*0.015)),
    //       child: DecoratedBox(
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             image: AssetImage('assets/images/flores.png'),
    //             fit: BoxFit.fitHeight),
    //         ),
            
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text('titulo', style: tituloGrandeBold,),
    //             Text('''Lorem ipsum odor amet, consectetuer adipiscing elit. 
    //             Egestas tempor sollicitudin tellus consectetur conubia 
    //             quisque ornare. Ut molestie ullamcorper mollis malesuada 
    //             risus ipsum commodo nullam. Ligula bibendum ultrices 
    //             parturient in suscipit tellus consequat. Class primis 
    //             mollis luctus donec porttitor quisque quis convallis. 
    //             Curabitur placerat sed ac fames, lectus nostra blandit 
    //             aptent. Velit sodales ornare in consequat dignissim magna. 
    //             Sodales nostra tincidunt aenean ipsum sed ac. 
    //             Efficitur turpis nibh habitant egestas scelerisque dictum. 
    //             Ornare nisl phasellus et risus eu bibendum. 
    //             Lectus habitasse accumsan ridiculus vel ultrices rutrum 
    //             fringilla. Sollicitudin potenti arcu fermentum vivamus primis 
    //             ullamcorper curae.''', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}