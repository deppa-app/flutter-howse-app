/*import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deppa_app/utils/utils.dart';
import 'package:flutter/material.dart';

class FilterButtonWidget extends StatefulWidget {

  final Icon ?icon;
  final GestureTapCallback ?onTap;

  const FilterButtonWidget({ Key ?key, this.icon, this.onTap}) : super(key: key);

  @override
  State<FilterButtonWidget> createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Obtener la posición global del botón
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(Offset.zero, ancestor: overlay),
            button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );
        final double menuTop = position.top - button.size.height - 600;
        final double menuLeft = position.left - 5.0; // desplazamiento horizontal
        final RelativeRect adjustedPosition = position.shift(Offset(0,-menuTop));
        // Mostrar el menú flotante
        showMenu(
          context: context,
          position: adjustedPosition,
          items: [
             PopupMenuItem(
              value: 'dormitorio',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children:  [
                            const Icon(FontAwesomeIcons.bed, color: CustomColor.greenColor,),
                            const SizedBox(width: 15),
                            Text('Dormitorio', style: TextStyle(fontSize: Dimensions.extraSmallTextSize2, fontWeight: FontWeight.normal),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children:  [
                      _IncrementDecrementButtonWidget(),
                  
                    ],
                  )
                ]
                ),
            ),
          ],
        shape: CustomShapeBorder(),

          elevation: 8.0,
        ).then((value) {
        });
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: CustomColor.whiteColor2,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: CustomColor.greyColor.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: widget.icon,
      ),
    );
  }
}

class _IncrementDecrementButtonWidget extends StatefulWidget {

  final IconData ?icon;
  final int ?counter;
  final Function ?increaseFn;
  final Function ?decreaseFn;

  const _IncrementDecrementButtonWidget({Key ?key, this.icon, this.counter, this.increaseFn, this.decreaseFn,}) : super(key: key);

  @override
  State<_IncrementDecrementButtonWidget> createState() => _IncrementDecrementButtonWidgetState();
}

class _IncrementDecrementButtonWidgetState extends State<_IncrementDecrementButtonWidget> {

int counter = 0;
  
  void increase(){
    counter++;
    setState(() {});
  }
    void decrease(){
    counter--;
    setState(() {});
  }

    void reset(){
    counter -= counter;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: 25,
            width: 25,
          child: Container(
            decoration: BoxDecoration(
              color: CustomColor.whiteColor2,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: CustomColor.greyColor
              )
            ),
            child: Center(
              child: IconButton(
                icon:  Icon(FontAwesomeIcons.minus, color: CustomColor.greenColor, size: 16,),
                padding: const EdgeInsets.all(5),
                onPressed: () => decrease()
                ),
            ),
          ),
        ),
    
        SizedBox(
          width: 50,
          child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget> [
              Text('$counter',)
            ],
          ),
      ),
        ),
    
        SizedBox(
            height: 25,
            width: 25,
          child: Container(
            decoration: BoxDecoration(
              color: CustomColor.whiteColor2,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: CustomColor.greyColor
              )
            ),
            child: Center(
              child: IconButton(
                icon:  Icon(FontAwesomeIcons.plus, color: CustomColor.greenColor, size: 16,),
                padding: const EdgeInsets.all(5),
                onPressed: ()=> increase()
                ),
            ),
          ),
        ),
      ],
    );
  }
}
class CustomShapeBorder extends ShapeBorder{
  const CustomShapeBorder();
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
 Path getInnerPath(Rect rect, {required TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path? getOuterPath(Rect rect, {required TextDirection textDirection}) {
    return Path()
    ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)));
  }

  @override
  void paint(Canvas canvas, Rect rect, {required TextDirection textDirection}) {
    // TODO: implement paint
  }
  
  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
}*/