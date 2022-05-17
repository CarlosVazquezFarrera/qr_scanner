import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/providers/providers.dart';
import 'package:qr_scanner/utils/util.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({Key? key, required this.iconImage}) : super(key: key);

  final IconData iconImage;

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<ScansProvider>(context);
    final scans = dbProvider.scans;
    return ListView.separated(
      itemCount: scans.length,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        return BodyItem(iconImage: iconImage, scan: scans[index]);
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}

class BodyItem extends StatelessWidget {
  const BodyItem({Key? key, required this.iconImage, required this.scan})
      : super(key: key);

  final IconData iconImage;
  final Scan scan;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {
        final scansProvider =
            Provider.of<ScansProvider>(context, listen: false);
        scansProvider.deleteScan(scan.id!);
      },
      direction: DismissDirection.startToEnd,
      background: const SwipeActionLeft(),
      child: ListTile(
        leading: Icon(iconImage),
        title: Text(scan.content),
        subtitle: Text(scan.id.toString()),
        trailing: const Icon(Icons.arrow_forward_ios_sharp),
        onTap: () => Util.openUrl(scan, context),
      ),
    );
  }
}

class SwipeActionLeft extends StatelessWidget {
  const SwipeActionLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.only(left: 10),
        color: Colors.red,
        child: const Icon(Icons.delete_forever));
  }
}
