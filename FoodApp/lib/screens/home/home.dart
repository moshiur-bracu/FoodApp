import 'package:FoodApp/models/foodItem.dart';
import 'package:FoodApp/screens/home/drawer_screen.dart';
import 'package:FoodApp/screens/home/cart.dart';
import 'package:FoodApp/services/auth.dart';
import 'package:FoodApp/services/bloc/cartListBloc.dart';
import 'package:FoodApp/shared/constants.dart';
import 'package:FoodApp/shared/loading.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:FoodApp/models/sub_category_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:FoodApp/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  final textStyle = TextStyle(
    color: Colors.black,
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );

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

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: loading
          ? Loading()
          : Scaffold(
              key: _scaffoldKey,
              drawer: DrawerScreen(),
              appBar: homeAppBar(),
              body: Container(
                color: kPrimaryColor,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: (size.height * 0.30),
                      width: double.infinity,
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        children: <Widget>[
                          SearchField(),
                          FoodCategory(),
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
                                TodaysFood(),
                                TodaysFood(),
                                TodaysFood(),
                                TodaysFood(),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget homeAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: GestureDetector(
        child: Icon(Icons.menu),
        onTap: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      automaticallyImplyLeading: false,
      title: Center(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "Food",
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: "App",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
          child: new Container(
            height: 150.0,
            width: 30.0,
            child: StreamBuilder(
              stream: bloc.listStream,
              builder: (context, snapshot) {
                List<FoodItem> foodItems = snapshot.data;
                int length = foodItems != null ? foodItems.length : 0;
                return GestureDetector(
                  onTap: () {
                    if (length > 0) {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Cart()));
                    } else
                      return;
                  },
                  child: new Stack(
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        onPressed: null,
                      ),
                      new Positioned(
                        child: new Stack(
                          children: <Widget>[
                            new Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.white),
                            new Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: new Center(
                                child: new Text(
                                  length.toString(),
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: kSecondaryColor.withOpacity(0.32),
        ),
      ),
      child: TextField(
        //onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: "Search Food",
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class FoodCategory extends StatefulWidget {
  @override
  _FoodCategoryState createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  final List<Category> _catagories = categories;
  List<SubCategory> _subCategories = subCategories;

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 40.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _catagories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _onSelected(index);
                  if (_catagories[index].title == 'Combo Meal') {
                    _subCategories = subCategoriesComboMeal;
                  } else if (_catagories[index].title == 'Platter') {
                    _subCategories = subCategoriesPlatter;
                  } else if (_catagories[index].title == 'Burger') {
                    _subCategories = subCategoriesBurger;
                  } else if (_catagories[index].title == 'Pizza') {
                    _subCategories = subCategoriesPizza;
                  } else if (_catagories[index].title == 'Beverage') {
                    _subCategories = subCategoriesBeverage;
                  } else if (_catagories[index].title == 'Dessert') {
                    _subCategories = subCategoriesDessert;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        _catagories[index].title,
                        style: _selectedIndex != null && _selectedIndex == index
                            ? TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )
                            : TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      if (_selectedIndex != null && _selectedIndex == index)
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 3,
                          width: 22,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Flexible(
          child: Container(
            height: 65.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _subCategories.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return FoodCard(
                  category: _subCategories[index].category,
                  subCategoryName: _subCategories[index].subCategoryName,
                  imagePath: _subCategories[index].imagePath,
                  numberOfItems: _subCategories[index].numberOfItems,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  final String category;
  final String subCategoryName;
  final String imagePath;
  final int numberOfItems;

  FoodCard({
    this.category,
    this.subCategoryName,
    this.imagePath,
    this.numberOfItems,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedSubCategory(
                    category: category,
                    subCategoryName: subCategoryName,
                  )),
        );
      },
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage(imagePath),
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        subCategoryName,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        '$numberOfItems Kinds',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailedSubCategory extends StatefulWidget {
  final String category;
  final String subCategoryName;
  DetailedSubCategory({
    Key key,
    this.category,
    this.subCategoryName,
  }) : super(key: key);

  @override
  _DetailedSubCategoryState createState() => _DetailedSubCategoryState();
}

class _DetailedSubCategoryState extends State<DetailedSubCategory> {
  List<FoodItem> _foods = [];
  @override
  void initState() {
    super.initState();
    _foods = foodItemList.foodItems
        .where((i) =>
            i.subCategory == widget.subCategoryName &&
            i.category == widget.category)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text(widget.subCategoryName),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 200 / 270,
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          scrollDirection: Axis.vertical,
          itemCount: _foods.length,
          itemBuilder: (BuildContext context, int index) {
            var foodItem = _foods[index];
            return FoodTile(
              foodItem: foodItem,
            );
          },
        ),
      ),
    );
  }
}

class FoodTile extends StatelessWidget {
  final FoodItem foodItem;

  FoodTile({
    this.foodItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedScreen(
                      foodItem: foodItem,
                    )));
      },
      child: Container(
        height: 270.0,
        width: 200.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Container(
                  color: Colors.white,
                  height: 180.0,
                  width: 180.0,
                  child: Image(
                    image: AssetImage(foodItem.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 70,
              width: 180,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    foodItem.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SmoothStarRating(
                        rating: foodItem.ratings,
                        size: 18,
                      ),
                      Text(
                        foodItem.numberOfReviews.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        foodItem.price.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.add_box,
                        size: 29,
                        color: kPrimaryColor,
                      ),
                    ],
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

class DetailedScreen extends StatefulWidget {
  final FoodItem foodItem;

  DetailedScreen({
    Key key,
    this.foodItem,
  }) : super(key: key);

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  int _quantity = 1;
  void add() {
    setState(() {
      _quantity++;
    });
  }

  void minus() {
    setState(() {
      if (_quantity != 1) _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.foodItem.quantity = _quantity;
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
                        image: AssetImage(widget.foodItem.imagePath),
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
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.foodItem.name,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SmoothStarRating(
                                    size: 20,
                                    borderColor: kPrimaryColor,
                                    rating: widget.foodItem.ratings,
                                    //onRatingChanged: onRatingChanged,
                                  ),
                                  SizedBox(width: 10),
                                  Text(widget.foodItem.numberOfReviews
                                      .toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ClipPath(
                          clipper: PricerCliper(),
                          child: Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            height: 75,
                            width: 80,
                            color: kPrimaryColor,
                            child: Text(
                              ((widget.foodItem.price.toDouble()) * _quantity)
                                  .toDouble()
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Text('Food, substance consisting essentially of protein,'
                        'carbohydrate, fat, and other nutrients used in the body'
                        'of an organism to sustain growth and vital processes '
                        ' and to furnish energy. The absorption and utilization'
                        'of food by the body is fundamental to nutrition and is'
                        'facilitated by digestion.'),
                    Container(
                      // padding: EdgeInsets.all(20),
                      width: size.width * 0.40,
                      height: size.height * 0.07,
                      // it will cover 80% of total width
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      elevation: 4,
                                      heroTag: "btn_1",
                                      onPressed: minus,
                                      child: new Icon(
                                        const IconData(0xe15b,
                                            fontFamily: 'MaterialIcons'),
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      backgroundColor: kPrimaryColor,
                                    ),
                                  ),
                                ),
                                new Text('$_quantity',
                                    style: new TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.0,
                                    )),
                                Container(
                                  height: 30,
                                  child: FittedBox(
                                    child: new FloatingActionButton(
                                      elevation: 4,
                                      heroTag: "btn_2",
                                      onPressed: add,
                                      child: new Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      backgroundColor: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Free space  10% of total height
                    SizedBox(
                      height: 20,
                    ),
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
                          widget.addToCart(widget.foodItem);
                          Fluttertoast.showToast(msg: 'Added to Cart');
                          Navigator.pop(context);
                        },
                        label: Text(
                          'ADD TO CART',
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

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TodaysFood extends StatefulWidget {
  @override
  _TodaysFoodState createState() => _TodaysFoodState();
}

class _TodaysFoodState extends State<TodaysFood> {
  List<FoodItem> _todaysFoods = [];
  @override
  void initState() {
    super.initState();
    _todaysFoods =
        foodItemList.foodItems.where((i) => i.timeOfMeal == 'today').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Todays Items',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /*GestureDetector(
                onTap: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),*/
            ],
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _todaysFoods.length,
              itemBuilder: (context, index) {
                var foodItem = _todaysFoods[index];
                return FoodTile(
                  foodItem: foodItem,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
