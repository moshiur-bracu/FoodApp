class SubCategory {
  final String subCategoryName;
  final String imagePath;
  final String category;
  final int numberOfItems;

  SubCategory(
      {this.subCategoryName,
      this.imagePath,
      this.category,
      this.numberOfItems});
}

List<SubCategory> subCategories = subCategoriesComboMeal;

final subCategoriesComboMeal = [
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/breakfast.png',
      category: 'Combo Meal',
      subCategoryName: 'Platter'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/burger.png',
      category: 'Combo Meal',
      subCategoryName: 'Burger'),
];
final subCategoriesPlatter = [
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/turkey.png',
      category: 'Platter',
      subCategoryName: 'Chicken'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/coffee-cup.png',
      category: 'Platter',
      subCategoryName: 'Beef'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/breakfast.png',
      category: 'Platter',
      subCategoryName: 'Fish'),
];
final subCategoriesBurger = [
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/turkey.png',
      category: 'Burger',
      subCategoryName: 'Chicken'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/coffee-cup.png',
      category: 'Burger',
      subCategoryName: 'Beef'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/breakfast.png',
      category: 'Burger',
      subCategoryName: 'Fish'),
];
final subCategoriesPizza = [
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/turkey.png',
      category: 'Pizza',
      subCategoryName: 'Chicken'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/coffee-cup.png',
      category: 'Pizza',
      subCategoryName: 'Beef'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/breakfast.png',
      category: 'Pizza',
      subCategoryName: 'Fish'),
];
final subCategoriesBeverage = [
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/coffee-cup.png',
      category: 'Beverage',
      subCategoryName: 'Hot'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/beer.png',
      category: 'Beverage',
      subCategoryName: 'Cold'),
];
final subCategoriesDessert = [
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/cupcake.png',
      category: 'Dessert',
      subCategoryName: 'Cake'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/cupcake.png',
      category: 'Dessert',
      subCategoryName: 'Waffle'),
  SubCategory(
      numberOfItems: 43,
      imagePath: 'assets/icons/cupcake.png',
      category: 'Dessert',
      subCategoryName: 'Others'),
];
