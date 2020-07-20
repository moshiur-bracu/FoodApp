import 'package:FoodApp/screens/auth_provider.dart';
import 'package:FoodApp/screens/home/cart.dart';
import 'package:FoodApp/screens/home/home.dart';
import 'package:FoodApp/screens/home/table_booking.dart';
import 'package:FoodApp/screens/wrapper.dart';
import 'package:FoodApp/services/auth.dart';
import 'package:FoodApp/shared/constants.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      color: kPrimaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Moshiur Rahman',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            title: Text(
              "Cart",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                  (route) => false);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            title: Text(
              "Table Booking",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TableBooking()),
                  (route) => false);
            },
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 2,
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.error_outline,
              color: Colors.black,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            onTap: () async {
              await _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthProvider()),
              );
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
