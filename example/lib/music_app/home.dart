import 'playlist_type.dart';
import 'package:flutter/material.dart';

import 'model/playlist.dart';
import 'model/song.dart';
import 'playlist_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = ScrollController();
  ValueNotifier<double> _opacity = ValueNotifier<double>(1.0);

  static var _recents = [
    Song(
        albumCover: "assets/thumb/815PpyOuOUQ.jpg",
        name: "Dirty Talk",
        artist: "Lothief"),
    Song(
        albumCover: "assets/thumb/DaKrLaniTjk.jpg",
        name: "Freak",
        artist: "Lothief"),
    Song(
        albumCover: "assets/thumb/DO2JNXhL2fE.jpg",
        name: "Sunshine",
        artist: "Lothief"),
    Song(
        albumCover: "assets/thumb/fIW3jcK1Esk.jpg",
        name: "Vida Loka",
        artist: "Lothief"),
    Song(
        albumCover: "assets/thumb/l6_UAx20jp8.jpg",
        name: "Misirlou",
        artist: "Lothief"),
    Song(
        albumCover: "assets/thumb/o_n2SNLc7GI.jpg",
        name: "Rising",
        artist: "Lothief"),
    Song(
        albumCover: "assets/thumb/QIB2RrUOqe4.jpg",
        name: "Sunshine",
        artist: "Lothief"),
    Song(
        albumCover: "assets/thumb/taFooeO0lBY.jpg",
        name: "The Bump",
        artist: "Lothief"),
    Song(
        albumCover: "assets/thumb/u0MYUB0ediE.jpg",
        name: "Deep Inside",
        artist: "Lothief"),
    Song(
        albumCover: "assets/thumb/XVztg3oXmX4.jpg",
        name: "Wurkit",
        artist: "Kyle Watson"),
    Song(
        albumCover: "assets/thumb/2X21RgXOs6Q.jpg",
        name: "Gypsy",
        artist: "Lothief")
  ];

  static var _foryou = [
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e02061da57cba0e5c67e794ab9e.jfif",
        name: "Why Don't U Love",
        artist: "Vintage Culture, Selva, Lazy Bear"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e02347fa3997b1094f32796814b.jfif",
        name: "Boneless (Remake)",
        artist: "Felguk, SUBB"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e02812b377d24177cff742ee9c0.jfif",
        name: "Miracle (feat. Vic Brow)",
        artist: "JØRD"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e02a8ebb606d141add503ff6ec3.jfif",
        name: "Okay Obey",
        artist: "MKJAY"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e02aae81ed46d385a81253b371d.jfif",
        name: "Sunshine",
        artist: "Black Spark"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e02b9d130fb325039db0d976ae3.jfif",
        name: "Love Me Again (Remix)",
        artist: "Chermical Surf"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e023d3f539bb4203db7f50bdfc1.jfif",
        name: "Okey",
        artist: "Gustavo Mota"),
    Song(
        albumCover:
            "assets/thumb/d84b328166686c80b2f5467ce050ba56568abf26.jfif",
        name: "Disco Fans",
        artist: "Black Spark"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e0232eca757d782fb2c36a8ea27.jfif",
        name: "Say Hi",
        artist: "Felguk"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e02d07c6ccd3d08e1a68d7f4fcb.jfif",
        name: "Tic Tac",
        artist: "JØRD, Almanac"),
  ];

  static var _artist = [
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e02fb6906ff39ee5ec9f230e05d.jfif",
        name: "Slow Down (feat. Jorja Smith)",
        artist: "Vintage Culture"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e0292b4ad028daf51730e301761.jfif",
        name: "Pontos de Exclamação",
        artist: "Vintage Culture"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e0209490d9da9807383e5582c77.jfif",
        name: "In the dark",
        artist: "Vintage Culture, Fancy Inc"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e022ca8af29fe8b94af84957154.jfif",
        name: "I will find",
        artist: "Vintage Culture, Rooftime"),
    Song(
        albumCover:
            "assets/thumb/ab67616d00001e02da606e95e6d3e2fe93f780cb.jfif",
        name: "Bros",
        artist: "Vintage Culture")
  ];

  Playlist recent = Playlist(
      name: "Recently Played",
      image: '',
      musicList: _recents,
      type: PlaylistType.PLAYLIST);
  Playlist dance = Playlist(
      name: "For You", image: '', musicList: _foryou, type: PlaylistType.ALBUM);
  Playlist artist = Playlist(
      name: "Vintage Culture",
      image: 'assets/thumb/e7d4950cc9a009c1e862d956ad8d84d329d6758e.jfif',
      musicList: _artist,
      type: PlaylistType.ARTIST);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_opacity.value == 1.0 && _controller.offset > 20) {
        _opacity.value = 0.0;
      } else if (_opacity.value == 0.0 && _controller.offset < 20) {
        _opacity.value = 1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      width: size.width,
      height: size.height,
      color: colorTheme.background,
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: _opacity,
            builder: (_, __, ___) {
              return AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _opacity.value,
                child: Container(
                  height: 90,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Opacity(
                              opacity: 1.0,
                              child: Text('',
                                  style: TextStyle(
                                      color: colorTheme.onPrimary,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Opacity(
                              opacity: 1.0,
                              child: Text('',
                                  style: TextStyle(
                                      color: colorTheme.onPrimary,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                      Icon(Icons.settings, color: colorTheme.onPrimary),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              );
            },
          ),
          ListView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            children: [
              PlaylistItem(playlist: recent, small: true),
              PlaylistItem(playlist: dance, small: false),
              PlaylistItem(playlist: artist, small: false),
            ],
          ),
        ],
      ),
    );
  }
}
