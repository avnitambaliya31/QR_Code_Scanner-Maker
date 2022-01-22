import 'package:flutter/material.dart';
import 'package:qr_generate_and_maker/pages/qr_code_maker.dart';
import 'package:qr_generate_and_maker/pages/qr_code_scanner.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [QRCodeMaker(), QRCodeScanner()];

  List<String> name = ["QR Maker", "QR Scanner"];

  List<IconData> iconData = [
    Icons.qr_code_2_outlined,
    Icons.qr_code_scanner_outlined
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBodyData(currentIndex),
      bottomNavigationBar: bottomBarData(),
    );
  }

  Widget _getBodyData(index) {
    return Container(
      child: pages[index],
    );
  }

  Widget bottomBarData() {
    return BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: List.generate(
            2,
            (index) => BottomNavigationBarItem(
                icon: Icon(
                  iconData[index],
                ),
                label: name[index])));
  }
}
