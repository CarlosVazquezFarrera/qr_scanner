import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/providers.dart';

class MapasSceen extends StatelessWidget {
  const MapasSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<ScansProvider>(context);
    final scans = dbProvider.scans;
    return ListView.separated(
      itemCount: scans.length,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        return ListTile(
          leading: const Icon(Icons.map),
          title: Text(scans[index].content),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          onTap: () {},
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
