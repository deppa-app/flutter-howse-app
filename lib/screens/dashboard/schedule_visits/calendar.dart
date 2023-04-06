import 'package:flutter/material.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  var current_selected_date = DateTime.now();

  void CallDatePicker() async {
    var selec_date = await getDatePickerWidget();
    setState(() {
      current_selected_date = selec_date!;
    });
  }

  //date
  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
      context: context,
      initialDate: current_selected_date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
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
              CallDatePicker();
            },
            child: const Icon(Icons.calendar_month),
          ),
        ),
      ),
    );
  }
}
