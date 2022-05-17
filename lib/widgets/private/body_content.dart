import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/providers/providers.dart';
import 'package:qr_scanner/utils/util.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final mapaPageOpend = navigationProvider.selectedIndexPage == 1;
    final dbProvider = Provider.of<ScansProvider>(context);
    final scans = dbProvider.scans;
    if (scans.isEmpty) {
      return _EmptyBody(
        itemName: mapaPageOpend ? 'Direciones' : 'Enlaces',
      );
    }
    return ListView.separated(
      itemCount: scans.length,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        return BodyItem(
            iconImage: mapaPageOpend ? Icons.directions : Icons.ads_click,
            scan: scans[index]);
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}

class _EmptyBody extends StatelessWidget {
  const _EmptyBody({
    Key? key,
    required this.itemName,
  }) : super(key: key);
  final String itemName;
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            color: Colors.grey,
            size: heigth * 0.25,
          ),
          Text(
            'No hay registro de $itemName',
            style: const TextStyle(fontSize: 25, color: Colors.grey),
          )
        ],
      ),
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
      background: const _SwipeActionLeft(),
      child: ListTile(
        leading: Icon(iconImage),
        title: Text(scan.content),
        subtitle: Text(scan.id.toString()),
        trailing: const Icon(Icons.arrow_forward_ios_sharp),
        onTap: () => Util.openContent(scan, context),
      ),
    );
  }
}

class _SwipeActionLeft extends StatelessWidget {
  const _SwipeActionLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.only(left: 10),
        color: Colors.red,
        child: const Icon(Icons.delete_forever));
  }
}
