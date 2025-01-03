import 'package:poster/core/domain/post/data_source/like_api.dart';
import 'package:poster/core/domain/post/data_source/post_api.dart';

abstract class PostRepository with PostApi, LikeApi {}
