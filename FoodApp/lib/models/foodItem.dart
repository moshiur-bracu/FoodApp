import 'package:meta/meta.dart';

class FoodItemList {
  List<FoodItem> foodItems;

  FoodItemList({
    @required this.foodItems,
  });
}

class FoodItem {
  String id;
  String name;
  String imagePath;
  String category;
  String subCategory;
  String timeOfMeal;
  double price;
  double discount;
  double ratings;
  int numberOfReviews;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.name,
    @required this.imagePath,
    @required this.category,
    @required this.subCategory,
    @required this.timeOfMeal,
    @required this.price,
    @required this.discount,
    @required this.ratings,
    @required this.numberOfReviews,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}

FoodItemList foodItemList = FoodItemList(foodItems: [
  FoodItem(
    id: '1',
    name: 'Drinks 1',
    imagePath: 'assets/images/beveragecold1.jpg',
    category: 'Beverage',
    subCategory: 'Cold',
    timeOfMeal: 'today',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '2',
    name: 'Drinks 2',
    imagePath: 'assets/images/beveragecold2.jpg',
    category: 'Beverage',
    subCategory: 'Cold',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '3',
    name: 'Drinks 3',
    imagePath: 'assets/images/beveragecold3.jpg',
    category: 'Beverage',
    subCategory: 'Cold',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '4',
    name: 'Drinks 4',
    imagePath: 'assets/images/beveragecold4.jpg',
    category: 'Beverage',
    subCategory: 'Cold',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '5',
    name: 'Drinks 5',
    imagePath: 'assets/images/beveragecold5.jpg',
    category: 'Beverage',
    subCategory: 'Cold',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '6',
    name: 'Drinks 6',
    imagePath: 'assets/images/beveragehot1.jpg',
    category: 'Beverage',
    subCategory: 'Hot',
    timeOfMeal: 'today',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '7',
    name: 'Drinks 7',
    imagePath: 'assets/images/beveragehot2.jpg',
    category: 'Beverage',
    subCategory: 'Hot',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '8',
    name: 'Drinks 8',
    imagePath: 'assets/images/beveragehot3.jpeg',
    category: 'Beverage',
    subCategory: 'Hot',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '9',
    name: 'Burger 1',
    imagePath: 'assets/images/burger1.jpg',
    category: 'Burger',
    subCategory: 'Chicken',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '10',
    name: 'Burger 2',
    imagePath: 'assets/images/burger2.jpg',
    category: 'Burger',
    subCategory: 'Chicken',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '11',
    name: 'Burger 3',
    imagePath: 'assets/images/burger3.jpg',
    category: 'Burger',
    subCategory: 'Chicken',
    timeOfMeal: 'today',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '12',
    name: 'Burger 4',
    imagePath: 'assets/images/burger4.jpg',
    category: 'Burger',
    subCategory: 'Beef',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '13',
    name: 'Burger 5',
    imagePath: 'assets/images/burger5.jpg',
    category: 'Burger',
    subCategory: 'Beef',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '14',
    name: 'Burger 6',
    imagePath: 'assets/images/burger6.jpg',
    category: 'Burger',
    subCategory: 'Fish',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '15',
    name: 'Burger 7',
    imagePath: 'assets/images/burger7.jpg',
    category: 'Burger',
    subCategory: 'Fish',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '16',
    name: 'Combo Meal 1',
    imagePath: 'assets/images/combomeal1.jpg',
    category: 'Combo Meal',
    subCategory: 'Platter',
    timeOfMeal: 'today',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '17',
    name: 'Combo Meal 2',
    imagePath: 'assets/images/combomeal2.jpg',
    category: 'Combo Meal',
    subCategory: 'Burger',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '18',
    name: 'Combo Meal 3',
    imagePath: 'assets/images/combomeal3.jpg',
    category: 'Combo Meal',
    subCategory: 'Burger',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '19',
    name: 'Combo Meal 4',
    imagePath: 'assets/images/combomeal4.jpg',
    category: 'Combo Meal',
    subCategory: 'Burger',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '20',
    name: 'Dessert 1',
    imagePath: 'assets/images/dessertcake1.jpg',
    category: 'Dessert',
    subCategory: 'Cake',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '21',
    name: 'Dessert 2',
    imagePath: 'assets/images/dessertcake2.jpg',
    category: 'Dessert',
    subCategory: 'Cake',
    timeOfMeal: 'today',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '22',
    name: 'Dessert 3',
    imagePath: 'assets/images/dessertcake3.jpg',
    category: 'Dessert',
    subCategory: 'Cake',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '23',
    name: 'Dessert 4',
    imagePath: 'assets/images/dessertcake4.jpg',
    category: 'Dessert',
    subCategory: 'Cake',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '24',
    name: 'Dessert 5',
    imagePath: 'assets/images/dessertothers1.jpg',
    category: 'Dessert',
    subCategory: 'Others',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '25',
    name: 'Dessert 6',
    imagePath: 'assets/images/dessertothers2.jpg',
    category: 'Dessert',
    subCategory: 'Others',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '26',
    name: 'Dessert 7',
    imagePath: 'assets/images/dessertwaffle1.jpg',
    category: 'Dessert',
    subCategory: 'Waffle',
    timeOfMeal: 'today',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '27',
    name: 'Dessert 8',
    imagePath: 'assets/images/dessertwaffle2.jpg',
    category: 'Dessert',
    subCategory: 'Waffle',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '28',
    name: 'Dessert 9',
    imagePath: 'assets/images/dessertwaffle3.jpg',
    category: 'Dessert',
    subCategory: 'Waffle',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '29',
    name: 'Pizza 1',
    imagePath: 'assets/images/pizza1.jpg',
    category: 'Pizza',
    subCategory: 'Chicken',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '30',
    name: 'Pizza 2',
    imagePath: 'assets/images/pizza2.jpg',
    category: 'Pizza',
    subCategory: 'Beef',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '31',
    name: 'Pizza 3',
    imagePath: 'assets/images/pizza3.jpg',
    category: 'Pizza',
    subCategory: 'Beef',
    timeOfMeal: 'today',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '32',
    name: 'Pizza 4',
    imagePath: 'assets/images/pizza4.jpg',
    category: 'Pizza',
    subCategory: 'Fish',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '33',
    name: 'Platter 1',
    imagePath: 'assets/images/platter1.jpg',
    category: 'Platter',
    subCategory: 'Beef',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '34',
    name: 'Platter 2',
    imagePath: 'assets/images/platter2.jpg',
    category: 'Platter',
    subCategory: 'Chicken',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '35',
    name: 'Platter 3',
    imagePath: 'assets/images/platter3.jpg',
    category: 'Platter',
    subCategory: 'Fish',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '36',
    name: 'Platter 4',
    imagePath: 'assets/images/platter4.jpeg',
    category: 'Platter',
    subCategory: 'Chicken',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '37',
    name: 'Platter 5',
    imagePath: 'assets/images/platter5.jpeg',
    category: 'Platter',
    subCategory: 'Fish',
    timeOfMeal: 'today',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
  FoodItem(
    id: '38',
    name: 'Platter 6',
    imagePath: 'assets/images/platter6.jpg',
    category: 'Platter',
    subCategory: 'Fish',
    timeOfMeal: 'lunch',
    price: 200.0,
    discount: 0.0,
    ratings: 4.5,
    numberOfReviews: 20,
  ),
]);
