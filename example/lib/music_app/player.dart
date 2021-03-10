import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  final Function onTap;

  Player({required this.onTap});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cardSize = MediaQuery.of(context).size.height * 0.4;
    return Material(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xFF57D780),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0B1220).withOpacity(0.0),
                    Color(0xFF0B1220).withOpacity(0.9)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                                height: MediaQuery.of(context).padding.top),
                            // Header
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () => widget.onTap(),
                                    iconSize: 32,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "PLAYING NOW",
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.bodyText1!
                                              .apply(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: cardSize,
                                width: cardSize,
                                child:
                                    Image.asset("assets/thumb/XVztg3oXmX4.jpg"),
                              ),
                            ),
                            // Music info
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Wurkit (Original Mix)",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.headline5!.apply(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Kyle Watson",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.headline6!.apply(
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 3,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 6),
                          ),
                          child: Slider(
                            inactiveColor: Colors.white.withOpacity(0.1),
                            activeColor: Colors.white,
                            value: 0.5,
                            min: 0.0,
                            max: 100.0,
                            onChanged: (double value) {},
                          ),
                        ),
                        //SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "00:35",
                                style: textTheme.bodyText2!.apply(
                                    color: Colors.white.withOpacity(0.7)),
                              ),
                              Text(
                                "-02:05",
                                style: textTheme.bodyText2!.apply(
                                    color: Colors.white.withOpacity(0.7)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.repeat,
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                              IconButton(
                                iconSize: 32,
                                onPressed: () {},
                                icon: Icon(Icons.skip_previous,
                                    color: Colors.white),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Color(0xFF0B1220),
                                child: Icon(Icons.pause, size: 32),
                                padding: EdgeInsets.all(16),
                                shape: CircleBorder(),
                                elevation: 0.0,
                              ),
                              IconButton(
                                iconSize: 32,
                                onPressed: () {},
                                icon:
                                    Icon(Icons.skip_next, color: Colors.white),
                              ),
                              IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shuffle,
                                  color: Colors.white.withOpacity(
                                      0.4), //Theme.of(context).accentColor.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
