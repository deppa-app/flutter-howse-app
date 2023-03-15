import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/widget.dart';

class FunctionalAdultScreen extends StatelessWidget {
   
  const FunctionalAdultScreen({Key key}) : super(key: key);
  
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
                IconButton(
                  icon: Icon(Icons.search_outlined),
                  onPressed: () => {}, 
                  ),
                const SizedBox(height: Dimensions.heightSize),
                const _ImgBuild(imageUrl: 'assets/images/home-key.png',),
                const SizedBox(height: Dimensions.heightSize *2),
                const _TittleText(tittle: 'Precios de arriendos en la RM siguen en\n alza sobre todo en 6 comunas y avisos\n en UF se triplican',),
                const SizedBox(height: Dimensions.heightSize),
                const _OverView(overview: 'Los precios de los arriendos en la región Metropolitana continúan mostrando alzas y en las comunas de Providencia, Vitacura y Peñalolén se registraron los mayores aumentos para departamentos; y en Huechuraba, Las Condes y La Florida para casas. Además, los precios publicados en UF se triplicaron.\n \n De acuerdo a información de Portalinmobiliario.com, si durante el segundo trimestre del 2021 el número de avisos publicados en UF era del 9%, ahora ese porcentaje se triplicó a un 28%.\n \n “Este incremento en el número de publicaciones en UF es un fenómeno que se ha ido acrecentando durante los últimos trimestres y se entiende como una medida de protección frente a la inflación”, explica Gianfranco Aste, gerente comercial de Portalinmobiliario.com.',),
                const SizedBox(height: Dimensions.heightSize *2),
                const _ImgBuild(imageUrl: 'assets/images/house2.png',),
                const SizedBox(height: Dimensions.heightSize *2),
                const _TittleText(tittle: 'Caída en la venta de viviendas en Chile',),
                const SizedBox(height: Dimensions.heightSize),
                const _OverView(overview: 'Las mayores bajas en 12 meses se observaron en las ventas de casas en el norte del país y en la zona central, con disminuciones de 49% y 46%, respectivamente. Por su parte, se detalló que en el sur de Chile el retroceso fue de 35%. Lo mismo sucede en el caso de departamentos: norte y sur exhibieron disminuciones de 39% y 34% anual, mientras en el sur solo cayeron 17%.\n \n Promediando ambos tipos de vivienda, norte y centro también se vieron más afectados, con retrocesos de 43% (a 2.044 unidades) y de 36% (a 13.802 unidades). En el sur disminuyeron 22%, a 4.793 unidades.\n\n En materia de oferta de viviendas, la de departamentos creció 7%, llegando a 95.556 unidades.',)


            ],
          ),
        )
        ),
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
    return Container(
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                width: 327,
                height: 207,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/images/no-image.jpg'),
                image: AssetImage(imageUrl)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TittleText extends StatelessWidget {

  final String tittle;

  const _TittleText({
    Key key, this.tittle = 'Sin título',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Text(
        tittle,
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
      padding: EdgeInsets.symmetric(horizontal: 110),
      child: Text(
        overview,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.subtitle1,
      )
      );
  }
}

