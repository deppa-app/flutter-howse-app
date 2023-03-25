import 'package:flutter/material.dart';
import 'package:deppa_app/screens/dashboard/booking_confirmed.dart';
import 'package:deppa_app/utils/dimensions.dart';
import '../../widgets/widget.dart';

class BookingPin extends StatefulWidget {
  const BookingPin({Key ?key}) : super(key: key);

  @override
  _BookingPinState createState() => _BookingPinState();
}

class _BookingPinState extends State<BookingPin> {
  // Se crea un controlador para el PIN
  final TextEditingController _pinController = TextEditingController();

  // Se crea una clave global para el formulario
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // Se inicializa el controlador del PIN con puntos
    _pinController.text = '••••';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          // Se asocia la clave global al formulario
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              // Se agrega un widget personalizado para el botón de regresar
               BackButtonGeneralWidget(),
              const SizedBox(height: Dimensions.heightSize * 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.marginSize,
                  vertical: Dimensions.heightSize * 2,
                ),
                child: Column(
                  children:  [
                    // Se agrega un widget personalizado para el texto principal
                    PrincipalString(),
                    // Se agrega un widget personalizado para el control del PIN
                    BookingPinWidget(),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.heightSize * 3.5),
              // Se agrega un widget personalizado para el botón de reserva
              SecondaryButtonWidget(
                title: "Reservar",
                // Se valida el formulario al presionar el botón "Reservar"
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, se navega a la pantalla de confirmación de reserva
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BookingConfirmed(),
                    ));
                  }
                },
              ),
              const SizedBox(height: Dimensions.heightSize * 2),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget personalizado para el texto principal
class PrincipalString extends StatelessWidget {
  const PrincipalString({
    Key ?key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Ingresa tu PIN para\n confirmar la reserva",
      style: TextStyle(
        color: Colors.black,
        fontSize: Dimensions.extraLargeTextSize * 1.5,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}
