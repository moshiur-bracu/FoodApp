import 'package:flutter/material.dart';
import 'package:FoodApp/shared/constants.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _n = 1;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 1) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      width: widget.size.width * 0.6,
      // it will cover 80% of total width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          //onTap: widget.press,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new FloatingActionButton(
                  heroTag: "btn_1",
                  onPressed: minus,
                  child: new Icon(
                      const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                      color: Colors.white),
                  backgroundColor: kPrimaryColor,
                ),
                new Text('$_n',
                    style: new TextStyle(color: Colors.black, fontSize: 50.0)),
                new FloatingActionButton(
                  heroTag: "btn_2",
                  onPressed: add,
                  child: new Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  backgroundColor: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
