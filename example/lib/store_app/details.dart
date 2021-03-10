import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Function onTap;

  const Details({Key? key, required this.onTap}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _colorTheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(20),
      color: _colorTheme.surface,
      width: _size.width,
      height: _size.height,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () => widget.onTap(),
                icon: Icon(
                  Icons.arrow_downward,
                  color: _colorTheme.onSurface,
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/thumb/store_tenis1.png",
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Text(
                  "Tênis Nike Air Max 97",
                  style: TextStyle(color: _colorTheme.onSurface),
                ),
              ],
            ),
          ),
          Text(
            "With exceptional cushioning and modern detailing, the Nike Air Max 97 radiates cool while providing extreme comfort. Its design is inspired by patterns of energy radiating from the earth—like the flow of lava and the ocean's rhythmic waves.",
            style: TextStyle(
              height: 1.5,
              color: _colorTheme.onSurface,
            ),
          ),
          SizedBox(height: _size.height * 0.1),
          Container(
            width: _size.width * 0.8,
            decoration: BoxDecoration(
              color: _colorTheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Order Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
