class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String> meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/fitness_app/rent.png',
      titleTxt: 'Rent',
      kacl: 525,
      meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/refill.png',
      titleTxt: 'Refill',
      kacl: 602,
      meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/return.png',
      titleTxt: 'Return',
      kacl: 53,
      meals: <String>['Recommend:', '800 kcal'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    // MealsListData(
    //   imagePath: 'assets/fitness_app/dinner.png',
    //   titleTxt: 'Dinner',
    //   kacl: 0,
    //   meals: <String>['Recommend:', '703 kcal'],
    //   startColor: '#6F72CA',
    //   endColor: '#1E1466',
    // ),
  ];
}
