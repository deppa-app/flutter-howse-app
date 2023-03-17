import 'package:flutter/material.dart';

class MyReservations extends StatelessWidget {
  const MyReservations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      // Obtener la posición global del botón
      final RenderBox button = context.findRenderObject() as RenderBox;
      final RenderBox overlay =
          Overlay.of(context).context.findRenderObject() as RenderBox;
      final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(Offset.zero, ancestor: overlay),
          button.localToGlobal(button.size.bottomRight(Offset.zero),
              ancestor: overlay),
        ),
        Offset.zero & overlay.size,
      );
      final double menuTop = position.top - button.size.height - 350;
      final double menuLeft = position.left - 5.0; // desplazamiento horizontal
      final RelativeRect adjustedPosition = position.shift(Offset(0, -menuTop));
      // Mostrar el menú flotante
    });
  }
}
