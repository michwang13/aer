class FeaturesData {
  FeaturesData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;

  static List<FeaturesData> tabIconsList = <FeaturesData>[
    FeaturesData(
      imagePath: 'assets/images/rent.png',
      titleTxt: 'Rent',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    FeaturesData(
      imagePath: 'assets/images/refill.png',
      titleTxt: 'Refill',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    FeaturesData(
      imagePath: 'assets/images/return.png',
      titleTxt: 'Return',
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
  ];
}
