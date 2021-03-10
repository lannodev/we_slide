import '../playlist_type.dart';
import 'song.dart';

class Playlist {
  final String name;
  final String image;
  final PlaylistType type;
  final List<Song> musicList;

  Playlist({
    required this.name,
    required this.image,
    required this.type,
    required this.musicList,
  });
}
