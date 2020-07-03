import 'package:FoodApp/screens/home/components/app_bar.dart';
import 'package:FoodApp/screens/home/components/body.dart';
import 'package:FoodApp/shared/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}
