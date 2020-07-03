import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final _scrollController = ScrollController();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withOpacity(0.50),
            colorScheme.background.withOpacity(0.10),
          ],
          stops: [0.01, 0.6],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
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
                        "Recent",
                        style: textTheme.subtitle2.apply(color: colorScheme.onPrimary),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "player",
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
                    height: 100,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.network("https://sun9-44.userapi.com/c858028/v858028378/9541a/PTXC2FvnX9g.jpg"),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.0),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
