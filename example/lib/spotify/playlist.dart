import '../model/song.dart';
import 'package:flutter/material.dart';

class Playlist extends StatefulWidget {
  Playlist({Key key}) : super(key: key);

  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  List<Song> playlist = [
    Song(
      albumCover: "assets/thumb/815PpyOuOUQ.jpg",
      name: "Music A",
    ),
    Song(
      albumCover: "assets/thumb/DaKrLaniTjk.jpg",
      name: "Music B",
    ),
    Song(
      albumCover: "assets/thumb/DO2JNXhL2fE.jpg",
      name: "Music C",
    ),
    Song(
      albumCover: "assets/thumb/fIW3jcK1Esk.jpg",
      name: "Music D",
    ),
    Song(
      albumCover: "assets/thumb/l6_UAx20jp8.jpg",
      name: "Music E",
    ),
    Song(
      albumCover: "assets/thumb/o_n2SNLc7GI.jpg",
      name: "Music F",
    ),
    Song(
      albumCover: "assets/thumb/QIB2RrUOqe4.jpg",
      name: "Music G",
    ),
    Song(
      albumCover: "assets/thumb/taFooeO0lBY.jpg",
      name: "Music H",
    ),
    Song(
      albumCover: "assets/thumb/u0MYUB0ediE.jpg",
      name: "Music I",
    ),
    Song(
      albumCover: "assets/thumb/XVztg3oXmX4.jpg",
      name: "Music J",
    ),
    Song(
      albumCover: "assets/thumb/2X21RgXOs6Q.jpg",
      name: "Music L",
    )
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text("Played recent", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 130.0,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                final item = playlist[index];
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(item.albumCover, fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      item.name,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ]);
              },
            ),
          )
        ],
      ),
    );
  }
}
