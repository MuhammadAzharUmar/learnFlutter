import 'package:flutter/material.dart';
import 'package:mvvm_architecture/ViewModel/view_model.dart';
import 'package:provider/provider.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // final viewModel=Provider.of(ViewModel()).context
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Provider Practice second"),),
      body: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.maxFinite,),
            const Text("decrementing state management using provider package"),
            Text('${viewModel.count}'),
            ElevatedButton(onPressed: (){viewModel.decrement();}, child: const Text("Decrement")),
        ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("First Screen")),
            
          ],
        );
        },
        
      ),
    );
  }
}