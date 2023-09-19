import 'package:flutter/material.dart';
import 'package:mvvm_architecture/View/second.dart';
import 'package:mvvm_architecture/ViewModel/view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final viewModel=Provider.of(ViewModel()).context
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Practice"),
      ),
      body: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.maxFinite,
              ),
              const Text("Incrementing state management using provider package"),
              Text('${viewModel.count}'),
              ElevatedButton(
                  onPressed: () {
                    viewModel.increment();
                  },
                  child: const Text("Increment")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ));
                  },
                  child: const Text("Second Screen")),
            ],
          );
          
        },
      ),
    );
  }
}
