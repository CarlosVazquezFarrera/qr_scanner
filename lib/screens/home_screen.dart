import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/providers.dart';
import 'package:qr_scanner/screens/screen.dart';
import 'package:qr_scanner/tables/tables.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
      ),
      body: const _HomeBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final dbProvier = DbProvier();
    dbProvier.getById(Tables.scan, 1);
    switch (navigationProvider.selectedIndexPage) {
      case 0:
        return const MapasSceen();
      case 1:
        return const DirectionsPage();
      default:
        return const MapasSceen();
    }
  }
}
