import 'package:FoodApp/screens/details/components/body_components/counter.dart';
import 'package:FoodApp/screens/details/components/body_components/item_image.dart';
import 'package:FoodApp/screens/details/components/body_components/order_button.dart';
import 'package:FoodApp/screens/details/components/body_components/title_price_rating.dart';
import 'package:FoodApp/services/auth.dart';
import 'package:FoodApp/shared/loading.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final String code;

  const Body({Key key, this.code}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    Size size = MediaQuery.of(context).size;
    String code = widget.code;
    return FutureBuilder(
        future: _auth.getDatabaseInstance(code),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Column(
              children: <Widget>[
                ItemImage(
                  imgSrc: snapshot.data['imgSrc'],
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
                          TitlePriceRating(
                            name: snapshot.data['name'],
                            numOfReviews: snapshot.data['numOfReviews'],
                            rating: snapshot.data['rating'],
                            price: snapshot.data['price'],
                            onRatingChanged: (value) {},
                          ),
                          Text(
                            snapshot.data['textDetails'],
                            //"Nowadays, making printed materials have become fast, easy and simple. If you want your promotional material to be an eye-catching object, you should make it colored. By way of using inkjet printer this is not hard to make. An inkjet printer is any printer that places extremely small droplets of ink onto paper to create an image.",
                            style: TextStyle(
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: size.height * 0.1),
                          CounterButton(
                            size: size,
                          ),
                          // Free space  10% of total height
                          SizedBox(
                            height: 20,
                          ),
                          OrderButton(
                            size: size,
                            press: () async {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else
            return Loading();
        });
  }
}
