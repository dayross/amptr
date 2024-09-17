

import 'package:amptr/domain/datasources/datasources.dart';
import 'package:amptr/domain/entities/entities.dart';

import 'package:dio/dio.dart';

class ImagesDatasourceImpl extends ImagesDatasource{
  final dio = Dio();
  @override
  Future<AlbumEntity> getAlbumImages(String cid, String albumHash) async{
    try{
      final response = await dio.get(
        'https://api.imgur.com/3/album/${albumHash}/images',
        options: Options(
          headers: {
            'Authorization' : 'CLIENT-ID $cid'
          }
        )
      );

      final AlbumEntity album = AlbumEntity.fromJson(response.data);
      print('album obtenido');
      return album;

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