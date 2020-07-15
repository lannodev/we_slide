import 'package:example/spotify/playlist_type.dart';
import 'package:flutter/material.dart';

import 'model/playlist.dart';
import 'model/song.dart';
import 'playlist_item.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = ScrollController();
  var _opacity = 1.0;

  static var songs = [
    Song(albumCover: "assets/thumb/815PpyOuOUQ.jpg", name: "Dirty Talk", artist: "Lothief"),
    Song(albumCover: "assets/thumb/DaKrLaniTjk.jpg", name: "Freak", artist: "Lothief"),
    Song(albumCover: "assets/thumb/DO2JNXhL2fE.jpg", name: "Sunshine", artist: "Lothief"),
    Song(albumCover: "assets/thumb/fIW3jcK1Esk.jpg", name: "Vida Loka", artist: "Lothief"),
    Song(albumCover: "assets/thumb/l6_UAx20jp8.jpg", name: "Misirlou", artist: "Lothief"),
    Song(albumCover: "assets/thumb/o_n2SNLc7GI.jpg", name: "Rising", artist: "Lothief"),
    Song(albumCover: "assets/thumb/QIB2RrUOqe4.jpg", name: "Sunshine", artist: "Lothief"),
    Song(albumCover: "assets/thumb/taFooeO0lBY.jpg", name: "The Bump", artist: "Lothief"),
    Song(albumCover: "assets/thumb/u0MYUB0ediE.jpg", name: "Deep Inside", artist: "Lothief"),
    Song(albumCover: "assets/thumb/XVztg3oXmX4.jpg", name: "Wurkit", artist: "Kyle Watson"),
    Song(albumCover: "assets/thumb/2X21RgXOs6Q.jpg", name: "Gypsy", artist: "Lothief")
  ];

  Playlist recent = Playlist(name: "Recently Played", image: '', musicList: songs, type: PlaylistType.PLAYLIST);
  Playlist dance = Playlist(name: "Dance & Eletronic", image: '', musicList: songs, type: PlaylistType.ALBUM);
  Playlist artist = Playlist(name: "Lothief", image: 'https://djmagbr.com/wp-content/uploads/2019/03/capalothief3-664x400.jpg', musicList: songs, type: PlaylistType.ARTIST);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        if (_opacity == 1.0 && _controller.offset > 20) {
          setState(() => _opacity = 0.0);
        } else if (_opacity == 0.0 && _controller.offset < 20) {
          setState(() => _opacity = 1.0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF404040),
            Color(0xFF181818),
            Color(0xFF181818),
            Color(0xFF181818),
            Color(0xFF181818),
          ],
          begin: Alignment(-0.4, -1.2),
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: _opacity,
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
                      child: Opacity(opacity: 1.0, child: Text('', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Opacity(opacity: 1.0, child: Text('', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
                    ),
                  ),
                  Icon(Icons.settings, color: Colors.white),
                  SizedBox(width: 10),
                ],
              ),
            ),
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
