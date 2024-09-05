
import 'dart:math';

import 'package:amptr/config/constants/environment.dart';
import 'package:amptr/domain/entities/entities.dart';
import 'package:amptr/infrastructure/repositories/repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageProvider = StateNotifierProvider<ImageNotifier, ImageState>((ref) {
  return ImageNotifier();
});

class ImageNotifier extends StateNotifier<ImageState>{
  ImageNotifier() : super(ImageState());

  final repository = ImagesRepositoryImpl();

  void getAlbum() async{
    try{
      state = state.copyWith(loading: true);
      final response = await repository.getAlbumImages(Environment.imgurCid, Environment.albumHash);

      state = state.copyWith( album: response.data );

    } catch(e){
      rethrow;
    }
  }

  void chooseSong() async{
    final _random = Random();

    print('choosing song from album');

    if (state.album==null){ 
      getAlbum();
    }
    while(state.album==null){
      await Future.delayed(const Duration(milliseconds: 100));
    }
    
    ImageEntity img = state.album![_random.nextInt(state.album!.length)];

    while(img.link == state.image){
      img = state.album![_random.nextInt(state.album!.length)];
    }

    await Future.delayed(const Duration(milliseconds: 400));

    state = state.copyWith(
      image: img.link,
      loading: false
    ); 
  }

}


class ImageState{
  final String? image;
  final List<ImageEntity>? album;
  final bool loading;

  ImageState({
    this.image, 
    this.album, 
    this.loading = false, 
  });

  ImageState copyWith({
    String? image,
    List<ImageEntity>? album,
    bool? loading,
  })=> ImageState(
      image : image ?? this.image,
      album : album ?? this.album,
      loading : loading ?? this.loading
  );
}