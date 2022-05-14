import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/providers.dart';

class ProviderService {
  static getProviders(BuildContext context) {
    return [
      ChangeNotifierProvider<NavigationProvider>(
        create: (_) => NavigationProvider(),
      ),
      ChangeNotifierProxyProvider<NavigationProvider, ScansProvider>(
        create: (_) => ScansProvider(),
        update: (_, navigationProvider, myNotifier) =>
            myNotifier!..update(navigationProvider.selectedIndexPage),
      )
    ];
  }
}
