import 'package:flutter/material.dart';
import 'package:howse_app/screens/dashboard/booking_confirmed.dart';
import 'package:howse_app/utils/custom_color.dart';
import 'package:howse_app/utils/dimensions.dart';
import 'package:pin_keyboard/pin_keyboard.dart';
import 'package:pin_keyboard/pin_keyboard_controller.dart';
import '../../widgets/widget.dart';

class BookingPin extends StatefulWidget {
  const BookingPin({Key key}) : super(key: key);

  @override
  _BookingPinState createState() => _BookingPinState();
}

class _BookingPinState extends State<BookingPin> {
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _pinController.text = '••••'; //se inicializa el controlador del PIN con asteriscos
    super.initState();
  }

  void _onPinEntered(String pin) => setState(() => _pinController.text = pin.padRight(4, "•"));

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const BackGeneralWidget(),
            const SizedBox(height: Dimensions.heightSize * 2),
            
            principalPinKeyboard(),
            const SizedBox(height: Dimensions.heightSize * 3.5),

            SecondaryButtonWidget(
              title: "Reservar",
              onTap: () {
                if (_formKey.currentState.validate()) { // se valida el formulario al presionar el botón "Reservar"
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
    );
  }

  Padding principalPinKeyboard() {
    return Padding(
            padding: const EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
              top: Dimensions.heightSize * 2,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PrincipalString(),
                  const SizedBox(height: Dimensions.heightSize * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 4; i++) // se crea una fila con 4 círculos para representar los dígitos del PIN
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0, right: 6.0, bottom: 6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black12,
                              )
                            ),
                            child: CircleAvatar(
                              backgroundColor: i < _pinController.text.length ? const Color.fromARGB(1, 229, 229, 229) : Colors.green[300],  // se cambia el color de fondo del círculo si se ha ingresado un dígito
                              radius: 25,
                              child: Text(
                                i < _pinController.text.length ? _pinController.text[i] : "", // se muestra el dígito ingresado si corresponde
                                style: const TextStyle(
                                  fontSize: 41,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.heightSize * 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Container(
                      padding: const EdgeInsets.only(left:16.0, right:16.0,top: 20, bottom: 35.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200], 
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Colors.black12, width: 1.5),
                      ),
                      child: Column(
                        children: [
                          pinKeyboard(),
                          GestureDetector(
                            onTap: () {
                            },
                            child: const Text(
                              'Olvidé mi contraseña',
                              style: TextStyle(
                                color: CustomColor.colorBlack,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
/*
Este widget crea una pantalla para ingresar un PIN de cuatro dígitos.
El usuario puede ingresar un dígito a la vez y se muestra en la pantalla.
Los dígitos ingresados se almacenan en una variable _pinController.
Los círculos que representan los dígitos del PIN cambian de color cuando se ingresa un dígito.
*/
  PinKeyboard pinKeyboard() {
    return PinKeyboard(
                        space: 95,
                        length: 4,
                        fontSize: 41,
                        fontWeight: FontWeight.w600,
                        textColor: CustomColor.colorBlack,
                        controller: PinKeyboardController(),
                        onChange: _onPinEntered,
                      );
  }
}
class PrincipalString extends StatelessWidget {
  const PrincipalString({
    Key key,
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
