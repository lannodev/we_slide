import 'package:flutter/material.dart';

class MiniPlayer extends StatefulWidget {
  MiniPlayer({Key key}) : super(key: key);

  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF282828),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 70.0,
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              child: Image.asset("assets/thumb/XVztg3oXmX4.jpg", fit: BoxFit.cover),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('In the dark - Vintage Culture', style: TextStyle(color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis),
                  SizedBox(width: 8, height: 8),
                  Row(
                    children: [
                      Icon(Icons.devices, color: Colors.white, size: 14),
                      SizedBox(width: 5, height: 5),
                      Expanded(
                        child: Text('Available Devices', style: TextStyle(color: Colors.white, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 20),
            Icon(Icons.favorite_border, color: Colors.white),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.play_arrow, color: Colors.white, size: 30),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
