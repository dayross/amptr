
import 'package:amptr/domain/datasources/datasources.dart';
import 'package:amptr/domain/entities/poems/poem_entity.dart';
import 'package:dio/dio.dart';

class PoemsDatasourceImpl extends PoemsDatasource{

  final dio = Dio();

  @override
  Future<Contenido> getPoemaByType(String type) async{
    try{
      final response = await dio.get(
        'http://150.136.49.236/$type'
      );

      final Contenido text = Contenido.fromJson(response.data);
      return text;
      } catch (e){
        rethrow;
      }
  }

  @override
  Future<PoemaEntity> getRandom() async{
    try{
      final response = await dio.get(
        'http://150.136.49.236/random'
      );

      final PoemaEntity text = PoemaEntity.fromJson(response.data);
      return text;

      } catch (e){
        rethrow;
      }
  }
    

}