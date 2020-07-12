import 'package:flutter/material.dart';
import 'miniplayer.dart';
import 'home.dart';

class Spotify extends StatefulWidget {
  Spotify({Key key}) : super(key: key);

  @override
  _SpotifyState createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        MiniPlayer(),
        Container(height: 1, color: Colors.grey[800]),
        BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
            BottomNavigationBarItem(icon: Icon(Icons.library_books), title: Text('Your Library')),
          ],
          elevation: 0,
          backgroundColor: Color(0xFF282828),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (index) {},
        ),
      ]),
    );
  }
}
