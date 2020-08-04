import 'package:flutter/material.dart';

import 'custom_card.dart';

class Home extends StatelessWidget {
  final Function onTap;
  const Home({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: _size.height * .35,
          color: Color(0xFF57D780),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Hi Mary 👋",
                  style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.w900, color: Colors.white),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      CustomCard(
                        title: "Tênis Nike Air Max 97",
                        image: "assets/thumb/store_tenis1.png",
                        ontap: onTap,
                      ),
                      CustomCard(
                        title: "Tênis Nike AF1",
                        image: "assets/thumb/store_tenis2.png",
                        ontap: onTap,
                      ),
                      CustomCard(
                        title: "Tênis Nike Pegasus Turbo",
                        image: "assets/thumb/store_tenis3.png",
                        ontap: onTap,
                      ),
                      CustomCard(
                        title: "Tênis Nike Revolution 5",
                        image: "assets/thumb/store_tenis4.png",
                        ontap: onTap,
                      ),
                      CustomCard(
                        title: "Nike Air Vapormax ",
                        image: "assets/thumb/store_tenis5.png",
                        ontap: onTap,
                      ),
                      CustomCard(
                        title: "Tênis Nike Renew Run",
                        image: "assets/thumb/store_tenis6.png",
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0)
              ],
            ),
          ),
        )
      ],
    );
  }
}
