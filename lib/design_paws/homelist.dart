import 'adopt_page.dart';
import 'package:modernlogintute/design_paws/introduction_animation/introduction_animation_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'lib/images/pawsLogo.jpg',
      navigateScreen: const IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'lib/images/pawsLogo.jpg',
      navigateScreen: const DesignCourseHomeScreen(),
    ),
  ];
}
