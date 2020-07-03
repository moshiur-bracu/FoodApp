import 'package:FoodApp/screens/wrapper.dart';
import 'package:FoodApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FoodApp/models/user.dart';

class Provider extends StatelessWidget {
  // This widget is the root of Donor
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user, child: Wrapper());
  }
}
