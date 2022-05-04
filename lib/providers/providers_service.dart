import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/navigation_provider.dart';

class ProviderService {
  static getProviders(BuildContext context) {
    return [ChangeNotifierProvider(create: (_) => NavigationProvider())];
  }
}
