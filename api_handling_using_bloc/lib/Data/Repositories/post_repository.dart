import 'package:api_handling_using_bloc/Data/Repositories/API/api.dart';
import 'package:api_handling_using_bloc/Model/postmodel.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final API _api = API();
  Future<List<PostModel>> fetchData() async {
    try {
      Response response = await _api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((map) => PostModel.fromJson(map)).toList();
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
