import 'package:hackust/app_theme.dart';
import 'package:hackust/models/features_data.dart';
import 'package:hackust/main.dart';
import 'package:flutter/material.dart';

class FeaturesView extends StatefulWidget {
  const FeaturesView(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;

  @override
  _FeaturesViewState createState() => _FeaturesViewState();
}

class _FeaturesViewState extends State<FeaturesView>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<FeaturesData> featuresData = FeaturesData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: Container(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: featuresData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                      featuresData.length > 10 ? 10 : featuresData.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return MealsView(
                    featuresData: featuresData[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class MealsView extends StatelessWidget {
  const MealsView(
      {Key key, this.featuresData, this.animationController, this.animation})
      : super(key: key);

  final FeaturesData featuresData;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return GestureDetector(
          onTap: () => editModalBottomSheet(context),
          child: FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(
                  100 * (1.0 - animation.value), 0.0, 0.0),
              child: SizedBox(
                width: 130,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32, left: 8, right: 8, bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: HexColor(featuresData.endColor)
                                    .withOpacity(0.6),
                                offset: const Offset(1.1, 4.0),
                                blurRadius: 8.0),
                          ],
                          gradient: LinearGradient(
                            colors: <HexColor>[
                              HexColor(featuresData.startColor),
                              HexColor(featuresData.endColor),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(54.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 16, right: 16, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                featuresData.titleTxt,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: 0.2,
                                  color: AppTheme.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, bottom: 3),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: AppTheme.nearlyWhite.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 8,
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(featuresData.imagePath),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

void editModalBottomSheet(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Center(
          child: Container(
            color: Colors.indigo[600],
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.indigo[400],
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Text(
                        "Place near reader to proceed",
                        style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 0.27,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child:
                          Image(image: AssetImage("assets/images/qr_code.png")),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
