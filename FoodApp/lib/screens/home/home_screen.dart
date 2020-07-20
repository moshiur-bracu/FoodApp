import 'package:FoodApp/screens/home/home.dart';
import 'package:FoodApp/screens/home/table_booking.dart';
import 'package:FoodApp/shared/constants.dart';
import 'package:FoodApp/shared/loading.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool loading = false;
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit an App'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: new Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: loading
          ? Loading()
          : Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                leading: GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                  child: Icon(Icons.menu),
                ),
              ),
              drawer: Drawer(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('This is the Drawer'),
                      RaisedButton(
                        onPressed: _closeDrawer,
                        child: const Text('Close Drawer'),
                      ),
                    ],
                  ),
                ),
              ),
              // Disable opening the drawer with a swipe gesture.
              drawerEnableOpenDragGesture: false,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ButtonTheme(
                      height: size.height * 0.075,
                      minWidth: size.width * 0.7,
                      buttonColor: kPrimaryColor,
                      child: RaisedButton.icon(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        elevation: 5.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        label: Text(
                          'Order Foods',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                      height: size.height * 0.075,
                      minWidth: size.width * 0.7,
                      buttonColor: kPrimaryColor,
                      child: RaisedButton.icon(
                        icon: Icon(
                          Icons.table_chart,
                          color: Colors.black,
                        ),
                        elevation: 5.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TableBooking()));
                        },
                        label: Text(
                          'Book a Table',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
