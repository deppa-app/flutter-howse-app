import 'package:deppa_app/utils/strings.dart';

class OnBoardingItem {
  final String ?title;
  final String ?image;
  final String ?subTitle;

  const OnBoardingItem({this.title, this.image, this.subTitle});
}

class OnBoardingItems {
  static List<OnBoardingItem> loadOnboardItem() {
    const fi = <OnBoardingItem>[
      OnBoardingItem(
        title: Strings.title1,
        image: 'assets/images/onboard/distancia.png',
        subTitle: Strings.subTitle1,
      ),
      OnBoardingItem(
        title: Strings.title2,
        image: 'assets/images/onboard/face.png',
        subTitle: Strings.subTitle2,
      ),
      OnBoardingItem(
        title: Strings.title3,
        image: 'assets/images/onboard/escape.png',
        subTitle: Strings.subTitle3,
      ),
    ];
    return fi;
  }
}
