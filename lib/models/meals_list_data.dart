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
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/refill.png',
      titleTxt: 'Refill',
      kacl: 602,
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/fitness_app/return.png',
      titleTxt: 'Return',
      kacl: 53,
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
  ];
}
