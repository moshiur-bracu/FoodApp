import 'package:FoodApp/models/foodItem.dart';
import 'package:FoodApp/screens/home/drawer_screen.dart';
import 'package:FoodApp/screens/home/home.dart';
import 'package:FoodApp/services/bloc/cartListBloc.dart';
import 'package:FoodApp/shared/constants.dart';
import 'package:FoodApp/shared/loading.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cart extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foodItems;
    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          foodItems = snapshot.data;
          return WillPopScope(
            onWillPop: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
              return Future.value(false);
            },
            child: Scaffold(
              appBar: cartAppBar(),
              drawer: DrawerScreen(),
              body: SafeArea(
                child: Container(
                  color: kPrimaryColor,
                  child: CartBody(
                    foodItems: foodItems,
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

  Widget cartAppBar() {
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

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;
  CartBody({this.foodItems});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: foodItems.length > 0 ? foodItemList() : noItemContainer(),
          ),
        ],
      ),
    );
  }

  Container noItemContainer() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.remove_shopping_cart,
              size: 50,
              color: Colors.black,
            ),
            Text(
              'No Items in the Cart!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView foodItemList() {
    return ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (builder, index) {
          return CartListItem(foodItem: foodItems[index]);
        });
  }
}

class CartListItem extends StatelessWidget {
  final FoodItem foodItem;
  CartListItem({@required this.foodItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OrderTile(foodItem: foodItem),
    );
  }
}

class OrderTile extends StatefulWidget {
  final FoodItem foodItem;

  OrderTile({
    Key key,
    this.foodItem,
  }) : super(key: key);

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  removeFromCart(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(widget.foodItem.imagePath),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    widget.foodItem.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (widget.foodItem.quantity != 1)
                              widget.foodItem.quantity--;
                          });
                        },
                        child: Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.foodItem.quantity.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            widget.foodItem.quantity++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    (widget.foodItem.price * widget.foodItem.quantity)
                        .toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.cancel,
                      size: 30,
                    ),
                    onTap: () {
                      widget.removeFromCart(widget.foodItem);
                      Fluttertoast.showToast(msg: 'Removed from Cart!');
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
