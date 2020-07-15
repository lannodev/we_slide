import '../playlist_type.dart';
import 'song.dart';

class Playlist {
  final String name;
  final String image;
  final PlaylistType type;
  final List<Song> musicList;

  Playlist({
    this.name,
    this.image,
    this.type,
    this.musicList,
  });
}
