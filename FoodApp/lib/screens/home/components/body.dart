import 'package:FoodApp/screens/home/components/body_components/category_list.dart';
import 'package:FoodApp/screens/home/components/body_components/discount_card.dart';
import 'package:FoodApp/screens/home/components/body_components/item_list.dart';
import 'package:FoodApp/shared/components/search_box.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          CategoryList(),
          ItemList(),
          DiscountCard(),
        ],
      ),
    );
  }
}
