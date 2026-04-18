import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post_model.dart';

abstract class PostLocalDataSource{
  Future<List<PostModel>> getCachedPost();
  Future<Unit> cachedPost(List<PostModel> postModels);
}

class PostLocalDataImp implements PostLocalDataSource{
  final SharedPreferences sharedPreferences;

  PostLocalDataImp({required this.sharedPreferences});
  @override
  Future<Unit> cachedPost(List<PostModel> postModels) {
   List postModelToJson = postModels.map<Map<String,dynamic>>((postModel) => postModel.toJson()).toList();
   sharedPreferences.setString("CACHED_POST",json.encode(postModelToJson));
   return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPost() {
    sharedPreferences.get("CACHED_POST");
    throw UnimplementedError();
  }

}


