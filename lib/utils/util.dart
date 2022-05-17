import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  ///Open the link into the browser
  static openContent(Scan scan, BuildContext context) async {
    if (scan.type == 1) {
      await launchUrl(Uri.parse(scan.content));
    } else {
      await Navigator.pushNamed(context, AppRoutes.mapa, arguments: scan);
    }
  }
}
