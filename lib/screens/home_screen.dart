import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/enum/dialogs.dart';
import 'package:qr_scanner/providers/dialogs_provider.dart';
import 'package:qr_scanner/providers/providers.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirmation = await DialogsProvider()
                  .popConfirmationDialog<bool>(
                      Dialogs.confirmation,
                      context,
                      '¿Seguro que desea borrar todos los registros?',
                      '¡Está por borrar el historial!');
              if (!confirmation) return;

              final scansProvider =
                  Provider.of<ScansProvider>(context, listen: false);
              scansProvider.deleteAll();
            },
          ),
        ],
      ),
      body: const BodyContent(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
