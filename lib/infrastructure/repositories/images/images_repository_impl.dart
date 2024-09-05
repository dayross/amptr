

import 'package:amptr/domain/entities/images/album_entity.dart';
import 'package:amptr/domain/repositories/repositories.dart';
import 'package:amptr/infrastructure/datasources/datasources.dart';


class ImagesRepositoryImpl extends ImagesRepository{
  final dataSource = ImagesDatasourceImpl();
  @override
  Future<AlbumEntity> getAlbumImages(String cid, String albumHash) {
    return dataSource.getAlbumImages(cid, albumHash);
  }

}