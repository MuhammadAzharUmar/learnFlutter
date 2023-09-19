import 'package:api_handling_using_bloc/Model/postmodel.dart';

abstract class PostState{}
class PostLoadingState extends PostState{}
class PostLoadedState extends PostState{
  List<PostModel> posts;
  PostLoadedState(this.posts);
}
class PostErrorState extends PostState{
  String error;
  PostErrorState(this.error);
}