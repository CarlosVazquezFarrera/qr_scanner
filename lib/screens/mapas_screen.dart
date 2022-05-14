import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/providers.dart';

class MapasSceen extends StatelessWidget {
  const MapasSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<ScansProvider>(context);
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        return ListTile(
          leading: const Icon(Icons.map),
          title: const Text('XXX'),
          subtitle: Text(index.toString()),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          onTap: () {},
        );
      },
      itemCount: 10,
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
