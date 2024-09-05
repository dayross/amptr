
import 'package:amptr/domain/entities/images/album_entity.dart';

abstract class ImagesDatasource{
  Future<AlbumEntity> getAlbumImages(String cid, String albumHash);
}