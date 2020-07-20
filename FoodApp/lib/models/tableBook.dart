import 'package:meta/meta.dart';

class TableBookItemList {
  List<TableBook> tableBooks;

  TableBookItemList({
    @required this.tableBooks,
  });
}

class TableBook {
  String id;
  String name;
  String category;
  String imagePath;
  String date;
  String time;
  bool availibility;

  TableBook({
    @required this.id,
    @required this.name,
    @required this.category,
    @required this.imagePath,
    this.date = '',
    this.time = 'Breakfast',
    this.availibility = true,
  });
}

TableBookItemList tableBookItemList = TableBookItemList(tableBooks: [
  TableBook(
    id: '1',
    name: '1',
    category: '1-2',
    imagePath: 'assets/images/1-2person1.jpg',
  ),
  TableBook(
    id: '2',
    name: '2',
    category: '1-2',
    imagePath: 'assets/images/1-2person2.jpg',
  ),
  TableBook(
    id: '3',
    name: '3',
    category: '1-2',
    imagePath: 'assets/images/1-2person3.jpg',
  ),
  TableBook(
    id: '4',
    name: '4',
    category: '1-2',
    imagePath: 'assets/images/1-2person4.jpg',
  ),
  TableBook(
    id: '5',
    name: '5',
    category: '1-2',
    imagePath: 'assets/images/1-2person5.jpg',
  ),
  TableBook(
    id: '6',
    name: '6',
    category: '3-4',
    imagePath: 'assets/images/3-4person1.jpg',
  ),
  TableBook(
    id: '7',
    name: '7',
    category: '3-4',
    imagePath: 'assets/images/3-4person2.jpg',
  ),
  TableBook(
    id: '8',
    name: '8',
    category: '5-6',
    imagePath: 'assets/images/5-6person1.jpg',
  ),
  TableBook(
    id: '9',
    name: '9',
    category: '5-6',
    imagePath: 'assets/images/5-6person2.jpg',
  ),
  TableBook(
    id: '10',
    name: '10',
    category: '5-6',
    imagePath: 'assets/images/5-6person3.jpg',
  ),
]);
