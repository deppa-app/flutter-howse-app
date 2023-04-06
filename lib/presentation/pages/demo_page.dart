import 'package:flutter/material.dart';
import 'package:deppa_app/features/autocapture/presentation/pages/autocapture_demo_page.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final List<String> _documentTypes = ['CHL1', 'CHL2', 'ARG1', 'ARG2']; // Option 2
  String _selectedDocument = "CHL2";

  // Option 2
  @override
  Widget build(BuildContext context) {
    final documentSelector = DropdownButton(
      hint: const Text('Seleccione el tipo de documento'), // Not necessary for Option 1
      value: _selectedDocument,
      onChanged: (newValue) {
        setState(() {
          _selectedDocument = newValue.toString();
        });
      },
      items: _documentTypes.map((location) {
        return DropdownMenuItem(
          child: Text(location),
          value: location,
        );
      }).toList(),
    );

    final buttons = Container(
      margin: const EdgeInsets.only(top: 40, bottom: 0, left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              child: const Text('Face and Document'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AutocaptureDemoPage(documentType: _selectedDocument)),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // background
                onPrimary: Colors.white,
                // foreground
              ),
            ),
          ),
        ],
      ),
    );
    final double screenWidth = MediaQuery.of(context).size.width;
    final body = Container(
      width: screenWidth,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: const Image(
                image: AssetImage("assets/images/logo_orizon.png"),
              )),
          const Text(
            "Seleccione el tipo de documento",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          documentSelector,
          buttons,
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('TOC Demo')),
      body: Container(color: Colors.black, child: body),
    );
  }
}
