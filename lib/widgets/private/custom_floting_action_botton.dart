import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/providers.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String scan = 'http://www.udemy.com';
        //String scan = 'geo:20.86,-86.89';

        // String scan = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        // if (scan == '-1') return;
        final isValidScan = scan.contains('geo') || scan.contains('http');
        if (!isValidScan) return;

        final scansProvider =
            Provider.of<ScansProvider>(context, listen: false);
        scansProvider.newScan(scan);
      },
      tooltip: 'Escanea un código',
    );
  }
}
