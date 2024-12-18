import 'package:get_it/get_it.dart';
import 'package:poster/core/data/post/data_source/like_api.dart';
import 'package:poster/core/data/post/data_source/post_api.dart';
import 'package:poster/core/data/post/repository/post_repository.dart';
import 'package:poster/core/domain/post/data_source/like_api.dart';
import 'package:poster/core/domain/post/data_source/post_api.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';

extension PostModule on GetIt {
  void registerPostModule() {
    registerLazySingleton<LikeApi>(() => LikeApiImpl(client: this()));
    registerLazySingleton<PostApi>(() => PostApiImpl(client: this()));
    registerLazySingleton<PostRepository>(() => PostRepositoryImpl(postApi: this(), likeApi: this()));
  }
}
