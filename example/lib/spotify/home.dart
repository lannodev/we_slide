import 'package:flutter/material.dart';

import 'playlist.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = ScrollController();

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
            opacity: 1.0,
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
                Icon(Icons.settings, color: Colors.white),
                SizedBox(width: 10),
              ],
            ),
          ),
          ListView(
            controller: _controller,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            children: [
              Playlist(),
            ],
            //children: [...Utils.homeList.asMap().entries.map((item) => PlaylistItem(click: widget.click, playlist: item.value, small: item.key == 0))],
          ),
        ],
      ),
    );
  }
}
