
import 'package:amptr/domain/entities/music/playlist_entity.dart';
import 'package:amptr/domain/entities/music/token_spotify_entity.dart';
import 'package:amptr/domain/repositories/repositories.dart';
import 'package:amptr/infrastructure/datasources/datasources.dart';

class SpotifyRepositoryImpl extends SpotifyRepository{

  final dataSource = SpotifyDatasourceImpl();
  @override
  Future<PlaylistEntity> getPlaylist(String token, String playlistUri) {
    return dataSource.getPlaylist(token, playlistUri);
  }

  @override
  Future<TokenEntity> getToken(String clientID, String clientSecret) {
    return dataSource.getToken(clientID, clientSecret);
  }

}