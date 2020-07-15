import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  Player({Key key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Container(
          color: Color(0xFF282828),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //   ),
          // ),
          child: Column(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 30),
                  child: FittedBox(
                    child: SizedBox(
                      width: 400,
                      height: 400,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(),
                        child: Image.asset("assets/thumb/XVztg3oXmX4.jpg", fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kyle Watson", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                          Text("Music a", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Icon(Icons.favorite_border, color: Colors.white),
                      SizedBox(width: 20.0),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 8, top: 15, bottom: 8),
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 4,
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6, disabledThumbRadius: 6),
                        thumbColor: Colors.white,
                        activeTrackColor: Colors.green,
                      ),
                      child: Slider(
                        value: 0.0,
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey[800],
                        max: 100,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20.0),
                      Text("01:00", style: TextStyle(color: Colors.white)),
                      Expanded(child: SizedBox()),
                      Text("-02:03", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 20.0),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20.0),
                      Icon(Icons.shuffle, color: Colors.white),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.skip_previous, color: Colors.white, size: 30),
                          SizedBox(width: 20.0),
                          SizedBox(width: 20.0),
                          Icon(Icons.skip_next, color: Colors.white, size: 30),
                        ],
                      )),
                      Icon(Icons.repeat, color: Colors.white),
                      SizedBox(width: 20.0),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(height: 20.0),
                      Icon(Icons.devices, color: Colors.white, size: 20),
                      Expanded(child: SizedBox()),
                      Icon(Icons.playlist_play, color: Colors.white),
                      SizedBox(height: 20.0),
                    ],
                  ),
                  SizedBox(height: 20.0),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
