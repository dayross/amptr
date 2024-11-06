

import 'package:amptr/domain/entities/entities.dart';

abstract class PoemsDatasource{
  Future<PoemaEntity> getRandom();
  
  Future<Contenido> getPoemaByType(String type);
}
