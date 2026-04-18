import 'package:equatable/equatable.dart';


/// it's a model working with the Presentation layer
///
///
class Post extends Equatable {

  final int id;
  final int title;
  final int body;

  const Post({required this.id,required this.title,required this.body});
  @override
  List<Object?> get props => [id,title,body];

}

