
import 'package:amptr/domain/entities/entities.dart';
import 'package:amptr/domain/repositories/repositories.dart';
import 'package:amptr/infrastructure/datasources/datasources.dart';


class PoemsRepositoryImpl extends PoemsRepository{
  final dataSource = PoemsDatasourceImpl();

  @override
  Future<Contenido> getPoemaByType(String type) {
    return dataSource.getPoemaByType(type);
  }

  @override
  Future<PoemaEntity> getRandom() {
    return dataSource.getRandom();
  }

}