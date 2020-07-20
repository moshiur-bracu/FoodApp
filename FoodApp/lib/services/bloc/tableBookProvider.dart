import 'package:FoodApp/models/tableBook.dart';

class TableBookProvider {
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<TableBook> tableBooks = [];

  List<TableBook> addToList(TableBook tableBook) {
    /*bool isPresent = false;

    if (tableBooks.length > 0) {
      for (int i = 0; i < tableBooks.length; i++) {
        if (tableBooks[i].id == tableBook.id) {
          increaseItemQuantity(tableBook);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }

      if (!isPresent) {
        tableBooks.add(tableBook);
      }
    } else {
      tableBooks.add(tableBook);
    }*/
    tableBooks.add(tableBook);

    return tableBooks;
  }

  List<TableBook> removeFromList(TableBook tableBook) {
    //if (foodItem.quantity > 1) {
    //only decrease the quantity
    //  decreaseItemQuantity(foodItem);
    //} else {
    //remove it from the list
    tableBooks.remove(tableBook);
    //}
    return tableBooks;
  }
}
