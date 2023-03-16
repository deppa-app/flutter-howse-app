import 'package:howse_app/utils/custom_color.dart';
import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {

  final Icon icon;
  final GestureTapCallback onTap;

  const FilterButtonWidget({ Key key, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Obtener la posición global del botón
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
        final RelativeRect position = RelativeRect.fromRect(
          Rect.fromPoints(
            button.localToGlobal(Offset.zero, ancestor: overlay),
            button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
          ),
          Offset.zero & overlay.size,
        );
        final double menuTop = position.top - button.size.height - 350;
        final double menuLeft = position.left - 5.0; // desplazamiento horizontal
        final RelativeRect adjustedPosition = position.shift(Offset(0,-menuTop));
        // Mostrar el menú flotante
        showMenu(
          context: context,
          position: adjustedPosition,
          items: [
            PopupMenuItem(
              value: 'Opción 1',
              child: Text('Opción 1'),
            ),
            PopupMenuItem(
              value: 'Opción 2',
              child: Text('Opción 2'),
            ),
            PopupMenuItem(
              value: 'Opción 3',
              child: Text('Opción 3'),
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
          color: CustomColor.whiteColor,
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
        child: icon,
      ),
    );
  }
}

class CustomShapeBorder extends ShapeBorder{
  const CustomShapeBorder();
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
    ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // TODO: implement paint
  }
  
  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }

}