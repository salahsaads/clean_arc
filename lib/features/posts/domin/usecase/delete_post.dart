import 'package:clean_arc/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../repository/posts_repository.dart';

class DeletePostUsaCase{
  final  PostsRepository repository;

  DeletePostUsaCase(this.repository);
  Future<Either<Failure,Unit>> call(int postId )async{
    return await repository.deletePost(postId);
  }
}
