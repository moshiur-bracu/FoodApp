import 'package:FoodApp/models/tableBook.dart';
import 'package:FoodApp/screens/home/drawer_screen.dart';
import 'package:FoodApp/screens/home/home.dart';
import 'package:FoodApp/services/bloc/tableBookListBloc.dart';
import 'package:FoodApp/shared/constants.dart';
import 'package:FoodApp/shared/loading.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class TableBooking extends StatelessWidget {
  final TableBookListBloc bloc = BlocProvider.getBloc<TableBookListBloc>();
  @override
  Widget build(BuildContext context) {
    List<TableBook> tableBooks;
    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          tableBooks = snapshot.data;
          return WillPopScope(
            onWillPop: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
              return Future.value(false);
            },
            child: Scaffold(
              appBar: tableBookingAppBar(),
              drawer: DrawerScreen(),
              body: SafeArea(
                child: Container(
                  child: TableBookBody(
                    tableBooks: tableBooks,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }

  Widget tableBookingAppBar() {
    return AppBar(
      elevation: 0,
      title: Center(
          child: Text(
        'My Cart',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}

class TableBookBody extends StatelessWidget {
  final List<TableBook> tableBooks;
  TableBookBody({this.tableBooks});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: tableBooks.length > 0
                ? tableBookItemList()
                : Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            size: 50,
                            color: Colors.black,
                          ),
                          Text(
                            'No Booking Found!',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonTheme(
                            height: 50,
                            minWidth: 200,
                            buttonColor: Colors.black,
                            child: RaisedButton(
                              elevation: 5.0,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailedTableCategory()));
                              },
                              child: Text(
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
          ),
        ],
      ),
    );
  }

  ListView tableBookItemList() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: tableBooks.length,
            itemBuilder: (builder, index) {
              return TableBookListItem(tableBook: tableBooks[index]);
            }),
      ],
    );
  }
}

class DetailedTableCategory extends StatefulWidget {
  @override
  _DetailedTableCategoryState createState() => _DetailedTableCategoryState();
}

class _DetailedTableCategoryState extends State<DetailedTableCategory> {
  List<TableBook> _list12 = [];
  List<TableBook> _list34 = [];
  List<TableBook> _list56 = [];
  void initState() {
    super.initState();
    _list12 =
        tableBookItemList.tableBooks.where((i) => i.category == '1-2').toList();
    _list34 =
        tableBookItemList.tableBooks.where((i) => i.category == '3-4').toList();
    _list56 =
        tableBookItemList.tableBooks.where((i) => i.category == '5-6').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text('Tables'),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.grey[300],
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '1-2 Person Tables',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 240.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _list12.length,
                  itemBuilder: (context, index) {
                    var tableBook = _list12[index];
                    return TableBookTile(
                      tableBook: tableBook,
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.grey[300],
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '3-4 Person Tables',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 240.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _list34.length,
                  itemBuilder: (context, index) {
                    var tableBook = _list34[index];
                    return TableBookTile(
                      tableBook: tableBook,
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.grey[300],
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '5-6 Person Tables',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 240.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _list56.length,
                  itemBuilder: (context, index) {
                    var tableBook = _list56[index];
                    return TableBookTile(
                      tableBook: tableBook,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TableBookTile extends StatelessWidget {
  final TableBook tableBook;

  TableBookTile({
    this.tableBook,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedBookScreen(
                      tableBook: tableBook,
                    )));
      },
      child: Container(
        height: 240.0,
        width: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Container(
                  color: Colors.white,
                  height: 180.0,
                  width: 180.0,
                  child: Image(
                    image: AssetImage(tableBook.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              width: 180,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Book',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailedBookScreen extends StatefulWidget {
  final TableBook tableBook;

  DetailedBookScreen({
    Key key,
    this.tableBook,
  }) : super(key: key);

  final TableBookListBloc bloc = BlocProvider.getBloc<TableBookListBloc>();

  addToCart(TableBook tableBook) {
    bloc.addToList(tableBook);
  }

  @override
  _DetailedBookScreenState createState() => _DetailedBookScreenState();
}

class _DetailedBookScreenState extends State<DetailedBookScreen> {
  final List<String> timeOfMeals = ['Breakfast', 'Lunch', 'Dinner'];
  final format = DateFormat("dd-MM-yyyy");
  DateTime date;
  String time = 'Breakfast';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: <Widget>[
          Container(
            height: (size.height * 0.45),
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: (size.height * 0.38),
                    width: (size.width * 0.63),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.tableBook.imagePath),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 300,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: DateTimeField(
                        autofocus: false,
                        format: format,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.black,
                          ),
                          hintText: 'Choose a date',
                          border: OutlineInputBorder(),
                        ),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              builder: (BuildContext context, Widget child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    primaryColor: kPrimaryColor,
                                    accentColor: kPrimaryColor,
                                    colorScheme: ColorScheme.light(
                                        primary: kPrimaryColor),
                                    buttonTheme: ButtonThemeData(
                                        textTheme: ButtonTextTheme.primary),
                                  ),
                                  child: child,
                                );
                              },
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                        onChanged: (selectedDate) => setState(() =>
                            widget.tableBook.date = selectedDate.toString()),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 300,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: DropdownButtonFormField(
                        value: time ?? 'Breakfast',
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.fastfood,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        items: timeOfMeals.map((city) {
                          return DropdownMenuItem(
                            value: city,
                            child: Text('$city'),
                          );
                        }).toList(),
                        onChanged: (selectedTime) => setState(
                            () => widget.tableBook.time = selectedTime),
                      ),
                    ),

                    // Free space  10% of total height
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(height: 20),
                    widget.tableBook.availibility == false
                        ? ButtonTheme(
                            height: size.height * 0.075,
                            minWidth: size.width * 0.7,
                            buttonColor: kPrimaryColor,
                            child: RaisedButton.icon(
                              icon: Icon(
                                Icons.event_available,
                                color: Colors.black,
                              ),
                              elevation: 5.0,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {
                                print(widget.tableBook.id);
                                print(widget.tableBook.name);
                                print(widget.tableBook.category);
                                print(widget.tableBook.date);
                                print(widget.tableBook.time);
                                print(widget.tableBook.availibility);
                              },
                              label: Text(
                                'Check Availibility',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : ButtonTheme(
                            height: size.height * 0.075,
                            minWidth: size.width * 0.7,
                            buttonColor: kPrimaryColor,
                            child: RaisedButton.icon(
                              icon: Icon(
                                Icons.book,
                                color: Colors.black,
                              ),
                              elevation: 5.0,
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              onPressed: () {
                                widget.addToCart(widget.tableBook);
                                Fluttertoast.showToast(
                                    msg: 'Table Booking Successful!');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TableBooking()));
                              },
                              label: Text(
                                'Book Now',
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TableBookListItem extends StatelessWidget {
  final TableBook tableBook;
  TableBookListItem({@required this.tableBook});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: TableBookListTile(tableBook: tableBook),
    );
  }
}

class TableBookListTile extends StatefulWidget {
  final TableBook tableBook;

  TableBookListTile({
    Key key,
    this.tableBook,
  }) : super(key: key);

  final TableBookListBloc bloc = BlocProvider.getBloc<TableBookListBloc>();

  removeFromCart(TableBook foodItem) {
    bloc.removeFromList(foodItem);
  }

  @override
  _TableBookListTileState createState() => _TableBookListTileState();
}

class _TableBookListTileState extends State<TableBookListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 0.0,
        margin: EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(widget.tableBook.imagePath),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Icon(Icons.cancel),
                    onTap: () {
                      widget.removeFromCart(widget.tableBook);
                      Fluttertoast.showToast(msg: 'Booking removed!');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
