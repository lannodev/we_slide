class Song {
  final String name;
  final String artist;
  final String album;
  final String albumCover;
  Song({
    required this.name,
    required this.artist,
    this.album = "",
    required this.albumCover,
  });
}
