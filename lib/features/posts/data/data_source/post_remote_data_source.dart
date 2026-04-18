import 'package:dartz/dartz.dart';
import '../models/post_model.dart';

abstract class PostRemoteDataSource{
  Future<List<PostModel>> getAllPost();
  Future<Unit> deletePost(int? postId);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPost(PostModel postModel);
}


class PostRemoteImpWithDio implements PostRemoteDataSource{


  @override
  Future<List<PostModel>> getAllPost() {
    // TODO: implement getAllPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> addPost(PostModel postModel) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int? postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel postModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }


  
}