import 'package:api_handling_using_bloc/Data/Repositories/post_repository.dart';
import 'package:api_handling_using_bloc/Model/postmodel.dart';
import 'package:api_handling_using_bloc/ViewModel/Cubits/PostCubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPost();
  }
  void fetchPost() async {
    try {
      PostRepository postRepository = PostRepository();
      List<PostModel> posts = await postRepository.fetchData();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
