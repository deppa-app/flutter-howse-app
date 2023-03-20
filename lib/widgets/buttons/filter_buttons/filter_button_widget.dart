import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:howse_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:howse_app/widgets/buttons/general_buttons/apply_button_widget.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';

import '../../widget.dart';

class FilterPopUpButtonWidget extends StatefulWidget {
  final GestureTapCallback onTap;

  const FilterPopUpButtonWidget({Key key,this.onTap})
      : super(key: key);

  @override
  State<FilterPopUpButtonWidget> createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterPopUpButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: CustomColor.whiteColor,
      child: QudsPopupButton(
          backgroundColor: CustomColor.whiteColor2,
          tooltip: 'T',
          items: getMenuItems(),
          child: const Icon(FontAwesomeIcons.filter, color: CustomColor.greenColor,),
          focusNode: FocusNode(),

      
          ),
    );
  }
}

List<QudsPopupMenuBase> getMenuItems() {
  return [
    QudsPopupMenuWidget(

      builder: (c) => Column(
        children: [
          const SizedBox(height: 15,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.filter, color: CustomColor.colorBlack),
                Text('Filtro', style: TextStyle(fontSize: Dimensions.smallTextSize, fontWeight: FontWeight.w600),)
              ],
            ),
          ),
          const SizedBox(height: 15,),

          const _SwitchButtonWidget(),
          const _buildParameter(
            icon: FontAwesomeIcons.bed,
            title: 'Dormitorio',
          ),
          const _buildParameter(
            icon: FontAwesomeIcons.toilet,
            title: 'Baños',
          ),
          const _buildParameter(
            icon: FontAwesomeIcons.house,
            title: 'Mts²',
          ),
          const SizedBox(height: 19),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.magnifyingGlassDollar,
                  color: CustomColor.greenColor,
                ),
                const SizedBox(width: 15),
                Expanded(
                    child: Text(Strings.priceRange,
                        style: TextStyle(
                            fontSize: Dimensions.extraSmallTextSize2,
                            fontWeight: FontWeight.normal))),
              ],
            ),
          ),
          const _buildRageSliderWidget(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 34),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const ApplyButtonWidget(title: 'Aplicar'),
          )
        ],
      ),
    )
  ];
}

class _principalString extends StatelessWidget {
  final String title;
  const _principalString({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: Dimensions.smallTextSize),
    ));
  }
}

class _buildRageSliderWidget extends StatelessWidget {
  const _buildRageSliderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 34),
      child: Column(
        children: const [RangeSliderWidget(), Text('380.000 - 600.000')],
      ),
    );
  }
}

class _buildParameter extends StatelessWidget {
  final IconData icon;
  final String title;

  const _buildParameter({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: CustomColor.greenColor,
          ),
          const SizedBox(width: 15),
          Expanded(
              child: Text(title,
                  style: TextStyle(
                      fontSize: Dimensions.extraSmallTextSize2,
                      fontWeight: FontWeight.normal))),
          const IncrementDecrementButtonWidget()
        ],
      ),
    );
  }
}

class _SwitchButtonWidget extends StatefulWidget {
  const _SwitchButtonWidget({Key key}) : super(key: key);

  @override
  State<_SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<_SwitchButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: LiteRollingSwitch(
        textSize: Dimensions.smallTextSize,
        value: false,
        textOn: 'Arriendo',
        textOff: 'Venta',
        colorOn: CustomColor.greenColor,
        colorOff: CustomColor.brownColor2,
        textOnColor: CustomColor.whiteColor2,
        textOffColor: CustomColor.whiteColor2,
        onChanged: (bool position) {
          print("The button is $position");
        },
        onDoubleTap: () {},
        onSwipe: () {},
        onTap: () {},
      ),
    ));
  }
}
