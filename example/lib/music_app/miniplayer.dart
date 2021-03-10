import 'package:flutter/material.dart';

class MiniPlayer extends StatefulWidget {
  MiniPlayer({Key? key, required this.onTap}) : super(key: key);
  final Function onTap;
  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      color: colorTheme.onBackground,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 71.0,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => widget.onTap(),
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Player()),
                  //   );
                  // },
                  child: Container(
                    width: 70,
                    height: 70,
                    child: Image.asset("assets/thumb/XVztg3oXmX4.jpg",
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Wurkit (Original Mix)',
                          style: TextStyle(color: colorTheme.onPrimary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(width: 8, height: 8),
                      Text('Kyle Watson',
                          style: TextStyle(
                              color: colorTheme.onPrimary.withOpacity(0.5),
                              fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Icon(Icons.favorite_border, color: colorTheme.onPrimary),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.play_arrow,
                      color: colorTheme.onPrimary, size: 30),
                ),
                SizedBox(width: 20),
              ],
            ),
            Divider(color: colorTheme.background, height: 1),
          ],
        ),
      ),
    );
  }
}
