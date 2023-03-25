import 'package:flutter/material.dart';
import 'package:deppa_app/utils/custom_color.dart';
import 'package:deppa_app/utils/dimensions.dart';
import 'package:pin_keyboard/pin_keyboard.dart';
import 'package:pin_keyboard/pin_keyboard_controller.dart';

class BookingPinWidget extends StatefulWidget {
  const BookingPinWidget({Key ?key}) : super(key: key);

  @override
  State<BookingPinWidget> createState() => _BookingPinWidgetState();
}

class _BookingPinWidgetState extends State<BookingPinWidget> {
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    _pinController.text = '••••'; //se inicializa el controlador del PIN con asteriscos
    super.initState();
  }

    void _onPinEntered(String pin) => setState(() => _pinController.text = pin.padRight(4, "•"));

  @override
  Widget build(BuildContext context) {
    return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height *.1),
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
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width),
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
                          const Text(
                            'Olvidé mi contraseña',
                            style: TextStyle(
                                color: CustomColor.colorBlack,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            );
  }
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


/* class PrincipalString extends StatelessWidget {
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
} */