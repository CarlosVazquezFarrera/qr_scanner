import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/providers.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(Icons.delete),
          ),
        ],
      ),
      body: const _HomeBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

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
