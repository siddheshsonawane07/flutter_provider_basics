import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/home_screen.dart';
import 'package:provider_basics/list_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ListProvider>(
      builder: (context, listprovidermodel, child) => Column(
        children: [
          const Text("second page"),
          Expanded(
            child: ListView.builder(
              itemCount: listprovidermodel.list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Text(listprovidermodel.list[index].toString());
              },
            ),
          ),
          const SizedBox(),
          Text(listprovidermodel.list.last.toString()),
          ElevatedButton(
            onPressed: () {
              listprovidermodel.add();
            },
            child: const Text("Add"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: const Text("Previous"),
          )
        ],
      ),
    ));
  }
}
