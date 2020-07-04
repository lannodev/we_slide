import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final _scrollController = ScrollController();

    List<String> thumb = [
      "assets/thumb/815PpyOuOUQ.jpg",
      "assets/thumb/DaKrLaniTjk.jpg",
      "assets/thumb/DO2JNXhL2fE.jpg",
      "assets/thumb/fIW3jcK1Esk.jpg",
      "assets/thumb/l6_UAx20jp8.jpg",
      "assets/thumb/o_n2SNLc7GI.jpg",
      "assets/thumb/QIB2RrUOqe4.jpg",
      "assets/thumb/taFooeO0lBY.jpg",
      "assets/thumb/u0MYUB0ediE.jpg",
      "assets/thumb/XVztg3oXmX4.jpg",
      "assets/thumb/2X21RgXOs6Q.jpg",
    ];

    return Container(
      child: ListView(
        padding: const EdgeInsets.all(12.0),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Config
              SizedBox(height: MediaQuery.of(context).padding.top),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: colorScheme.onPrimary.withOpacity(0.5),
                    ),
                    onPressed: () {},
                  )
                ],
              ),

              Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Recently",
                        style: textTheme.subtitle2.apply(color: colorScheme.onPrimary),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Played",
                            style: textTheme.headline5.apply(color: colorScheme.onPrimary),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: colorScheme.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    height: 90,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemCount: thumb.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(thumb[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "New Albums",
                            style: textTheme.headline5.apply(color: colorScheme.onPrimary),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: colorScheme.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemCount: thumb.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(thumb[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Selected for you",
                            style: textTheme.headline5.apply(color: colorScheme.onPrimary),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: colorScheme.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    height: 90,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemCount: thumb.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(thumb[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
