import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/providers.dart';

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
        return ListTile(
          leading: Icon(iconImage),
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
