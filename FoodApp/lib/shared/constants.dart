import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFFC61F);
const kSecondaryColor = Color(0xFFB5BFD0);
const kTextColor = Color(0xFF50505D);
const kTextLightColor = Color(0xFF6A727D);

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kTextColor),
  ),
);

List<Map> drawerItems = [
  {
    'icon': Icons.home,
    'title': 'Home',
  },
  {
    'icon': Icons.person,
    'title': 'Profile',
  },
  {
    'icon': Icons.shopping_cart,
    'title': 'Cart',
  },
  {
    'icon': Icons.calendar_today,
    'title': 'Table Booking',
  },
];
