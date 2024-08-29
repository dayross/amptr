


import 'package:amptr/domain/entities/entities.dart';

abstract class SpotifyRepository{
  Future<TokenEntity> getToken(String clientID, String clientSecret);

  Future<PlaylistEntity> getPlaylist(String token, String playlistUri);

  // Future<SongEntity> getTrack();
}