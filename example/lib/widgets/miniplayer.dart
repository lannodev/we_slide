import 'package:flutter/material.dart';

class MiniPlayer extends StatelessWidget {
  final Function onTap;
  const MiniPlayer({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: colorScheme.onBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 50.0,
                    width: 50.0,
                    child: Image.network("https://sun9-66.userapi.com/c858028/v858028378/95422/sb_LfqgbzNg.jpg"),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Wurkit (Original Mix)",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Kyle Watson",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: colorScheme.onPrimary.withOpacity(0.5),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              Icons.play_arrow,
                              color: colorScheme.onPrimary,
                              size: 32.0,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
