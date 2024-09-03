
import 'package:amptr/domain/datasources/datasources.dart';
import 'package:amptr/domain/entities/entities.dart';


import 'package:dio/dio.dart';

class SpotifyDatasourceImpl extends SpotifyDatasource{

  final dio = Dio();
  @override
  Future<TokenEntity> getToken(String clientID, String clientSecret) async{
    try{
      final response = await dio.post(
        'https://accounts.spotify.com/api/token',
        queryParameters: {
          'grant_type' : 'client_credentials',
          'client_id' : clientID,
          'client_secret' : clientSecret
        },
        options: Options(
          headers: {
            'Content-Type' : 'application/x-www-form-urlencoded'
          }
        )       
      );

      final TokenEntity token = TokenEntity.fromJson(response.data);
      print('token obtenido en dataspurce');
      return token;
    }  on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception(
            e.response?.data['error'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
    
  }


  @override
  Future<PlaylistEntity> getPlaylist(String token, String playlistUri) async{
    try{
      print('entrando a get playlist');
      final response = await dio.get(
        'https://api.spotify.com/v1/playlists/$playlistUri/tracks',
        options: Options(
          headers: {'Authorization' : 'Bearer $token'}
        )
      );

      final playlist = PlaylistEntity.fromJson(response.data);
      print('playlist obtenida');
      return playlist;

    }on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception(
            e.response?.data['error'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }

  }


}