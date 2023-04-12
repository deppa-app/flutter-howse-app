

import 'package:deppa_app/widgets/buttons/back_buttons/back_button_general_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VisitSearchDelegate extends SearchDelegate{

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar';

  @override
  InputDecorationTheme get searchFieldDecorationTheme =>
      InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: EdgeInsets.zero,
      );

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return const SizedBox.shrink();
  }



@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: kToolbarHeight,
                child: const BackButtonGeneralWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Buscar',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
      IconButton(
        icon:const Icon(FontAwesomeIcons.magnifyingGlass) ,
        onPressed: () {}, 
      )
    ];
  }



  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const Text('data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text('data: $query');
  }

}