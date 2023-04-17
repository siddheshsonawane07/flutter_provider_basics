import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basics/list_provider.dart';
import 'package:provider_basics/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ListProvider>(
      builder: (context, listprovidermodel, child) => Column(
        children: [
          const Text("HomePage"),
          Expanded(
            child: ListView.builder(
              itemCount: listprovidermodel.list.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(listprovidermodel.list[index].toString());
              },
            ),
          ),
          const SizedBox(height: 10),
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
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            },
            child: const Text("Next"),
          )
        ],
      ),
    ));
  }
}
