
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String spotifyCid =
      dotenv.env['SPOTIFY_CID'] ?? 'No está configurado SPOTIFY_CID';
  
  static String spotifySecret =
      dotenv.env['SPOTIFY_SECRET'] ?? 'No está configurado SPOTIFY_SECRET';
  
  static String imgurCid =
      dotenv.env['IMGUR_CID'] ?? 'No está configurado IMGUR_CID';
  
  static String imgurSecret =
      dotenv.env['IMGUR_SECRET'] ?? 'No está configurado IMGUR_SECRET';
  
  static String playlistUri =
      dotenv.env['PLAYLIST_URI'] ?? 'No está configurado PLAYLIST_URI';
  
  static String albumHash =
      dotenv.env['ALBUM_HASH'] ?? 'No está configurado ALBUM_HASH';

  static String poemasApiKey =
      dotenv.env['POEMAS_API_KEY'] ?? 'No está configurado POEMAS_API_KEY';


  static initEnvironment() async => await dotenv.load(fileName: '.env');
}
