import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/providers_service.dart';
import 'package:qr_scanner/routes/app_router.dart';
import 'package:qr_scanner/routes/app_routes.dart';
import 'package:qr_scanner/theme/custom_theme.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderService.getProviders(context),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QrScanner',
      routes: AppRoter.routes,
      theme: CustomTheme.customTheme,
      initialRoute: AppRoutes.home,
    );
  }
}
