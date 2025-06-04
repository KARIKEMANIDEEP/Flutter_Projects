import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatelessWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) {
          final Barcode? barcode = capture.barcodes.first;
          final String? code = barcode?.rawValue;
          if (code != null) {
            Navigator.pop(context); // Close scanner after detection
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Scanned: $code')),
            );
          }
        },
      ),
    );
  }
}
