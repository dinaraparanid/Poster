import 'package:poster/domain/post/post_api.dart';
import 'package:poster/domain/post/like_api.dart';

abstract class PostRepository with PostApi, LikeApi {}
