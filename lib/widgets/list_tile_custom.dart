import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deppa_app/utils/utils.dart';

class ListTileCustom extends StatelessWidget {
  final IconData fontAwesomeIcon;
  final String title;
  final GestureTapCallback onTap;

  const ListTileCustom(
    {Key ?key, 
    required this.fontAwesomeIcon, 
    required this.title, 
    required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        title: Row(children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 30
            ),
            child: Icon(Icons.circle,
            size: 10,
            color: Colors.black,
            ),
          ),

          title.length >= 27 
          ? const SizedBox(width: 10)
          : const SizedBox(width: 20), 
          
          FaIcon(
          fontAwesomeIcon, 
          color: Colors.black, 
          size: 30,
          ),

          const SizedBox(width: 10),
          
          Text(
            title,
            style: const TextStyle(
              color: CustomColor.colorBlack,
              fontSize: 16
              ),
            ),

          title.length >= 27 
          ? const SizedBox(width: 0)
          : const SizedBox(width: 100), 

          const Icon(
          Icons.keyboard_arrow_right,
          color: CustomColor.colorBlack,
          size: 35,
          ),
        ],
        
        )
      );
  }
}