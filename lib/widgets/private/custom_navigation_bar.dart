import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/providers.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final scansProvider = Provider.of<ScansProvider>(context);
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: navigationProvider.selectedIndexPage,
        onTap: (newIndex) {
          navigationProvider.setIndexPage = newIndex;
          scansProvider.loadSccandByType(newIndex + 1);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.language), label: 'Enlaces'),
          BottomNavigationBarItem(
              icon: Icon(Icons.place_rounded), label: 'Direcciones')
        ]);
  }
}
