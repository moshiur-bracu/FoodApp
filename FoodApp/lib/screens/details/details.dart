import 'package:FoodApp/screens/details/components/app_bar.dart';
import 'package:FoodApp/screens/details/components/body.dart';
import 'package:flutter/material.dart';
import 'package:FoodApp/shared/constants.dart';

class Details extends StatelessWidget {
  final String code;
  Details({this.code});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(),
      body: Body(code: code),
    );
  }
}
