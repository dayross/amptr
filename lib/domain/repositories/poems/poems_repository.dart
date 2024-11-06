

import 'package:amptr/domain/entities/entities.dart';

abstract class PoemsRepository{
  Future<PoemaEntity> getRandom();
  
  Future<Contenido> getPoemaByType(String type);
}
