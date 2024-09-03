

import 'dart:math';

import 'package:amptr/config/constants/environment.dart';
import 'package:amptr/domain/entities/music/playlist_entity.dart';
import 'package:amptr/infrastructure/repositories/music/spotify_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final trackProvider = StateNotifierProvider<TrackNotifier, TrackState>((ref) {
  return TrackNotifier();
});

class TrackNotifier extends StateNotifier<TrackState> {
  TrackNotifier(): super( TrackState());

  final repository = SpotifyRepositoryImpl();

  void getToken() async{
    try{
      state = state.copyWith(loading: true);
      final response = await repository.getToken(Environment.spotifyCid, Environment.spotifySecret);

      state = state.copyWith(
        token: response.accessToken);
      print('token obtenido');
    } catch(e){
      rethrow;
    }
  }

  void getPlaylist() async{
    try{
      if(state.token.isEmpty) getToken();
      
      while(state.token.isEmpty){
        await Future.delayed(const Duration(milliseconds: 100));
      }

      final response = await repository.getPlaylist(state.token, Environment.playlistUri);

      state = state.copyWith(
        playlist: response,
      );

    }catch(e){
      print(e);
      rethrow;
    }
  }

  void chooseTrack() async{
    final _random = Random();

    if (state.playlist==null){ 
      getPlaylist();
    }
    while(state.playlist==null){
      await Future.delayed(const Duration(milliseconds: 100));
    }
    
    Item song = state.playlist!.items[_random.nextInt(state.playlist!.items.length)];

    while(state.song == song.track){
      song = state.playlist!.items[_random.nextInt(state.playlist!.items.length)];
    }

    await Future.delayed(const Duration(milliseconds: 600));

    state = state.copyWith(song: song.track, loading: false);
    
  }
  
}


class TrackState{
  final String token;
  final PlaylistEntity? playlist;
  final bool? loading;
  final Track? song;

  TrackState({
    this.token = '', 
    this.playlist,
    this.loading,
    this.song
    });

  TrackState copyWith({
    String? token,
    PlaylistEntity? playlist,
    bool? loading,
    Track? song
  }) => TrackState(
    token : token ?? this.token , 
    playlist: playlist ?? this.playlist,
    loading: loading ?? this.loading,
    song: song ?? this.song,
    );
}