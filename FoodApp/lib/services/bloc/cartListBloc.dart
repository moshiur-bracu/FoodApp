import 'dart:async';
import 'package:FoodApp/models/foodItem.dart';
import 'package:FoodApp/services/bloc/cartProvider.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);

//provider class
  CartProvider cartProvider = CartProvider();

//output
  Stream<List<FoodItem>> get listStream => _listController.stream;

//input
  Sink<List<FoodItem>> get listSink => _listController.sink;

  addToList(FoodItem foodItem) {
    listSink.add(cartProvider.addToList(foodItem));
  }

  removeFromList(FoodItem foodItem) {
    listSink.add(cartProvider.removeFromList(foodItem));
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
