import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  ///Open the link into the browser
  static openUrl(Scan scan, BuildContext context) async {
    if (scan.type == 1) {
      final Uri _url = Uri.parse(scan.content);
      await launchUrl(_url);
    } else {
      Navigator.pushNamed(context, AppRoutes.mapa, arguments: scan);
    }
  }
}
