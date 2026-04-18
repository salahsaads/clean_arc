
import 'package:clean_arc/core/errors/failures.dart';
import '../entities/post.dart';
import 'package:dartz/dartz.dart';


///domain layer Repository Call Functions and return right and left right is the data return left is the failure
///
///
abstract class PostsRepository {

  Future<Either<Failure,List<Post>>> getAllPosts();
  Future<Either<Failure,Unit>> updatePost(Post post);
  Future<Either<Failure,Unit>> addPost(Post post);
  Future<Either<Failure,Unit>> deletePost(int id);


}