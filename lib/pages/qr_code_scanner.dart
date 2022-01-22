import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_generate_and_maker/pages/qr_code_maker.dart';
import 'package:qr_generate_and_maker/pages/qr_generator.dart';

class QRCodeScanner extends StatefulWidget {
  QRCodeScanner({Key? key}) : super(key: key);

  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  QRViewController? qrcodeDataController;
  final GlobalKey keydata = GlobalKey(debugLabel: "QR");

  @override
  void reassemble() async {
    // TODO: implement reassemble
    super.reassemble();

    if (Platform.isAndroid) {
      await qrcodeDataController!.pauseCamera();
    }

    qrcodeDataController!.resumeCamera();
  }

  Barcode? barcode;

  bool isFlashOn = false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: size.height,
              child: QRView(
                key: keydata,
                onQRViewCreated: onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderRadius: 20,
                    borderWidth: 10,
                    cutOutSize: size.width * 0.8,
                    borderColor: Theme.of(context).accentColor),
              )),
          Container(
              margin: EdgeInsets.only(
                top: 100,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "QR Code Scanner ",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )),
          Positioned(
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    barcode == null
                        ? "Scan a Code!"
                        : "Result : ${barcode!.code}",
                    maxLines: 5,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white),
                  ),
                ),
              )),
          Positioned(
              bottom: 120,
              left: size.width / 2.3,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      qrcodeDataController!.toggleFlash();

                      isFlashOn = !isFlashOn;
                    });
                  },
                  icon: Icon(
                    isFlashOn ? Icons.flash_off : Icons.flash_on,
                    color: Colors.white,
                    size: 35,
                  )))
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController qrViewController) {
    setState(() {
      this.qrcodeDataController = qrViewController;
    });

    qrcodeDataController!.scannedDataStream.listen((event) {
      setState(() {
        this.barcode = event;
      });

      // }
    });
  }
}
