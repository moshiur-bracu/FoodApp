import 'dart:async';
import 'package:FoodApp/models/tableBook.dart';
import 'package:FoodApp/services/bloc/tableBookProvider.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class TableBookListBloc extends BlocBase {
  TableBookListBloc();

  var _listController = BehaviorSubject<List<TableBook>>.seeded([]);

//provider class
  TableBookProvider tableBookProvider = TableBookProvider();

//output
  Stream<List<TableBook>> get listStream => _listController.stream;

//input
  Sink<List<TableBook>> get listSink => _listController.sink;

  addToList(TableBook tableBook) {
    listSink.add(tableBookProvider.addToList(tableBook));
  }

  removeFromList(TableBook tableBook) {
    listSink.add(tableBookProvider.removeFromList(tableBook));
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
