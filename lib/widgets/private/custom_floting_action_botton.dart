import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String scan = '';
        // String scan = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        // if (scan == '-1') return;
        print('Escaneado');
      },
      tooltip: 'Escanea un código',
    );
  }
}
