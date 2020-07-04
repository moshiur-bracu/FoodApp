import 'package:FoodApp/screens/home/components/body_components/item_card.dart';
import 'package:flutter/material.dart';
import 'package:FoodApp/screens/details/details.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            svgSrc: "assets/icons/burger_icon.png",
            title: "Burger",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Details(code: 'burger_1');
                  },
                ),
              );
            },
          ),
          ItemCard(
            svgSrc: "assets/icons/chinese_noodles.png",
            title: "Chinese & Noodles",
            press: () {},
          ),
          ItemCard(
            svgSrc: "assets/icons/burger_beer.png",
            title: "Burger & Beer",
            press: () {},
          )
        ],
      ),
    );
  }
}
