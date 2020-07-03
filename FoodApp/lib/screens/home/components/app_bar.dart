import 'package:FoodApp/screens/authentication/authenticate.dart';
import 'package:FoodApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:FoodApp/shared/constants.dart';

AppBar homeAppBar(BuildContext context) {
  final AuthService _auth = AuthService();

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
    ),
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Food",
            style: TextStyle(color: kSecondaryColor),
          ),
          TextSpan(
            text: "App",
            style: TextStyle(color: kPrimaryColor),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () {},
      ),
      RaisedButton.icon(
        color: Colors.white,
        elevation: 0,
        label: Text(
          'Sign Out',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        icon: Icon(Icons.close, color: Colors.white),
        onPressed: () async {
          await _auth.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Authenticate()),
          );
        },
      ),
    ],
  );
}
