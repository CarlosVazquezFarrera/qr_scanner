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
        return BodyItem(
            function: () => {},
            iconImage: iconImage,
            id: scans[index].id!,
            content: scans[index].content);
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}

class BodyItem extends StatelessWidget {
  const BodyItem({
    Key? key,
    required this.iconImage,
    required this.content,
    required this.id,
    required this.function,
  }) : super(key: key);

  final IconData iconImage;
  final String content;
  final int id;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {
        final scansProvider =
            Provider.of<ScansProvider>(context, listen: false);
        scansProvider.deleteScan(id);
      },
      direction: DismissDirection.startToEnd,
      background: const SwipeActionLeft(),
      child: ListTile(
        leading: Icon(iconImage),
        title: Text(content),
        subtitle: Text(id.toString()),
        trailing: const Icon(Icons.arrow_forward_ios_sharp),
        onTap: () {},
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
