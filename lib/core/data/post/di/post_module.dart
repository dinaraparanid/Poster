import 'package:get_it/get_it.dart';
import 'package:poster/core/data/post/data_source/like_api_impl.dart';
import 'package:poster/core/data/post/data_source/post_api_impl.dart';
import 'package:poster/core/data/post/repository/post_repository_impl.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/core/domain/post/data_source/like_api.dart';
import 'package:poster/core/domain/post/data_source/post_api.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/domain/profile/use_case/subscribe_on_profile_changes_use_case.dart';

extension PostModule on GetIt {
  List<Type> registerPostModule() => [
    provideSingleton<PostApi>(() => PostApiImpl()),
    provideSingleton<LikeApi>(() => LikeApiImpl()),
    provideSingleton<PostRepository>(() => PostRepositoryImpl(
      postApi: this(),
      likeApi: this(),
    )),
    provideSingleton<SubscribeOnProfileChangesUseCase>(() =>
      SubscribeOnProfileChangesUseCase(repository: this())
    ),
  ];
}
