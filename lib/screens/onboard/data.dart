<<<<<<< HEAD
=======

>>>>>>> main
import 'package:howse_app/utils/strings.dart';

class OnBoardingItem {
  final String title;
  final String image;
  final String subTitle;

  const OnBoardingItem({this.title, this.image, this.subTitle});
}

class OnBoardingItems {
<<<<<<< HEAD
  static List<OnBoardingItem> loadOnboardItem() {
    const fi = <OnBoardingItem>[
=======
  static List<OnBoardingItem> loadOnboardItem () {
    const fi = <OnBoardingItem> [
>>>>>>> main
      OnBoardingItem(
        title: Strings.title1,
        image: 'assets/images/onboard/1.png',
        subTitle: Strings.subTitle1,
      ),
      OnBoardingItem(
<<<<<<< HEAD
        title: Strings.title2,
        image: 'assets/images/onboard/2.png',
        subTitle: Strings.subTitle2,
      ),
      OnBoardingItem(
        title: Strings.title3,
        image: 'assets/images/onboard/3.png',
        subTitle: Strings.subTitle3,
=======
          title: Strings.title3,
          image: 'assets/images/onboard/3.png',
        subTitle: Strings.subTitle3,
      ),
      OnBoardingItem(
          title: Strings.title4,
          image: 'assets/images/onboard/4.png',
        subTitle: Strings.subTitle4,
>>>>>>> main
      ),
    ];
    return fi;
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> main
