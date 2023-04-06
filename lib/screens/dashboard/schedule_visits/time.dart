import 'package:flutter/material.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  var current_time = TimeOfDay.now();

  void CallTimePicker() async {
    var selec_time = await gettimePickerWidget();
    setState(() {
      current_time = selec_time!;
    });
  }

  //time
  Future<TimeOfDay?> gettimePickerWidget() {
    return showTimePicker(
      context: context,
      initialTime: current_time,
      builder: (context, child) {
        return Theme(data: ThemeData.light(), child: child!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.all(16.0), // Añade un relleno de 16.0 a todos los lados
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: CustomColor.greyColor,
            width: 0.5,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              CallTimePicker();
            },
            child: const Icon(Icons.timer),
          ),
        ),
      ),
    );
  }
}
