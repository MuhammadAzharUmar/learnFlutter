import 'package:api_handling_using_bloc/ViewModel/Cubits/PostCubit/post_cubit.dart';
import 'package:api_handling_using_bloc/ViewModel/Cubits/PostCubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Handling using Bloc"),
        centerTitle: true,
        elevation:  0,
      ),
      body: BlocConsumer<PostCubit,PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${index+1}\t${state.posts[index].title.toString()}"),
                  subtitle: Text(state.posts[index].body.toString()),
                );
              },
            );
          }
          return const Center(child:  Text("An Error Occured!"));
        },
        listener: (context, state) {
          if (state is  PostErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
      ),
    );
  }
}
