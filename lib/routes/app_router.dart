import 'package:flutter/material.dart';
import 'package:qr_scanner/screens/screen.dart';

import 'app_routes.dart';

class AppRoter {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.home: (_) => const HomeScreen()
  };
}
