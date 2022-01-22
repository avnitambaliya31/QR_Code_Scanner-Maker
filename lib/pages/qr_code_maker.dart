import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeMaker extends StatefulWidget {
  QRCodeMaker({Key? key}) : super(key: key);

  @override
  _QRCodeMakerState createState() => _QRCodeMakerState();
}

class _QRCodeMakerState extends State<QRCodeMaker> {
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 80),
              child: Center(
                  child: Text(
                "QR Code Maker ",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ))),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: QrImage(
              data: codeController.text,
              backgroundColor: Colors.white,
              size: 250,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: TextFormField(
              controller: codeController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: "Enter Your QR Data",
                  prefixIcon: Icon(
                    Icons.description_sharp,
                    color: Colors.black54,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.done,
                        color: Colors.green,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
                "Note* : Enter your details and after press the done button and get generate your code"),
          )
        ],
      ),
    );
  }
}
