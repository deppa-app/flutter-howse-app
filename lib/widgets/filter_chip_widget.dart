import 'package:deppa_app/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:deppa_app/utils/dimensions.dart';

class FilterChipWidget extends StatefulWidget {
  final String ?chipName;

  const FilterChipWidget({Key ?key, this.chipName}) : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName!),
      labelStyle: TextStyle(
        color: CustomColor.accentColor,
        fontSize: Dimensions.defaultTextSize,
      ),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: CustomColor.secondaryColor.withOpacity(0.7),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: CustomColor.primaryColor,
      pressElevation: 10,
    );
  }
}
