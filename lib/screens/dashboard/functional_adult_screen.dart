import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/utils.dart';
import '../../widgets/widget.dart';

class FunctionalAdultScreen extends StatefulWidget {
   
  const FunctionalAdultScreen({Key key}) : super(key: key);

  @override
  State<FunctionalAdultScreen> createState() => _FunctionalAdultScreenState();
}

class _FunctionalAdultScreenState extends State<FunctionalAdultScreen> {
String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
                const BackButtonGeneralWidget(),
                const SizedBox(height: Dimensions.heightSize),
                const _PrincipalString(),
                const SizedBox(height: Dimensions.heightSize),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  decoration:  InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8,  // altura de 32 - 16 (padding vertical)
                      horizontal: 14, // anchura de 285 - 16 (padding horizontal)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: CustomColor.greyColor
                      )
                    ),
                    suffixIcon: const Icon(FontAwesomeIcons.magnifyingGlass, color: CustomColor.greyColor, size: 16,),
                    hintText: 'Búsquedas',
                  ),
                  onChanged: (text) {
                    // Add your search logic here
                    _searchText = text;
                  },
                ),
              ),
                const SizedBox(height: Dimensions.heightSize *2),
                const CustomWidget(
                  imageUrl: 'assets/images/home-key.png',
                  title: 'Precios de arriendos en la RM siguen en\n alza sobre todo en 6 comunas y avisos\n en UF se triplican',
                  overview: 'Los precios de los arriendos en la región Metropolitana continúan mostrando alzas y en las comunas de Providencia, Vitacura y Peñalolén se registraron los mayores aumentos para departamentos',
                ),
                const SizedBox(height: Dimensions.heightSize *2),
            ].where((widget) {
                // Si _searchText está vacío, no se realiza ninguna filtración
                if (_searchText.isEmpty) {
                  return true;
                } else if (widget is CustomWidget &&
                    widget.title.toLowerCase().contains(_searchText.toLowerCase())) {
                  // Filtra los widgets para que solo se muestren aquellos que tienen un título que contiene _searchText
                  return true;
                } else {
                  return false;
                }
              }
              ).toList(),
          ),
        )
        ),
    );
  }
}
class CustomWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String overview;

    const CustomWidget({Key key, this.imageUrl, this.title, this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ImgBuild(imageUrl: imageUrl),
        SizedBox(width: 20),
        _TitleText(title: title),
        SizedBox(height: 10),
        _OverView(overview: overview),
      ],
    );
  }
}

class _PrincipalString extends StatelessWidget {
  const _PrincipalString({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Strings.blog,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: Dimensions.extraLargeTextSize * 1.5,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
class _ImgBuild extends StatelessWidget {

  final String imageUrl;

  const _ImgBuild({Key key, this.imageUrl}): super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30,bottom: 20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
              width: 327,
              height: 207,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/images/no-image.jpg'),
              image: AssetImage(imageUrl)),
          ),
        ],
      ),
    );
  }
}

class _TitleText extends StatelessWidget {

  final String title;

  const _TitleText({
    Key key, this.title = 'Sin título',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Dimensions.largeTextSize,
          fontWeight: FontWeight.w600
        ),
        ),
    );
  }
}

class _OverView extends StatelessWidget {

  final String overview ;

  const _OverView({
    Key key, this.overview = 'sin descripción',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: Text(
        overview,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.subtitle1,
      )
      );
  }
}
