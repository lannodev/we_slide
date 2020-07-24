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
                        title: "Shoe",
                        image: "https://static.netshoes.com.br/produtos/tenis-olympikus-blend-masculino/88/D22-2924-788/D22-2924-788_zoom1.jpg?ts=1571164115&ims=544x",
                        ontap: onTap,
                      ),
                      CustomCard(
                        title: "Earpod",
                        image:
                            "https://static.netshoes.com.br/produtos/fone-de-ouvido-wireless-i9s-tws-bluetooth-50-para-iphone-e-android/14/QWT-0070-014/QWT-0070-014_zoom1.jpg?ts=1595246302&ims=326x",
                        ontap: () {},
                      ),
                      CustomCard(
                        title: "Bicicle",
                        image:
                            "https://static.netshoes.com.br/produtos/bicicleta-aro-29-ksw-xlt-21v-cambios-shimano-freio-a-disco-mecanico-com-suspensao/72/CGY-0004-172/CGY-0004-172_zoom2.jpg?ts=1560959122&ims=326x",
                        ontap: () {},
                      ),
                      CustomCard(
                        title: "Whey",
                        image: "https://static.netshoes.com.br/produtos/whey-protein-100-pure-whey-900g-probiotica/99/168-9257-799/168-9257-799_zoom1.jpg?ts=1594049491&ims=326x",
                        ontap: () {},
                      ),
                      CustomCard(
                        title: "Nike Shoe",
                        image: "https://static.netshoes.com.br/produtos/tenis-nike-revolution-5-masculino/36/HZM-1731-036/HZM-1731-036_detalhe1.jpg?ts=1569489111?ims=280x280",
                        ontap: () {},
                      ),
                      CustomCard(
                        title: "Kegel Exercises",
                        image:
                            "https://static.netshoes.com.br/produtos/kit-bota-casual-e-sapatenis-sapatofran-relogio-e-carteira-masculino/56/HAP-0393-256/HAP-0393-256_zoom2.jpg?ts=1582034302&ims=326x",
                        ontap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
