import 'package:get_it/get_it.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/feature/wall/data/wall_post_paging_source_factory.dart';
import 'package:poster/feature/wall/presentation/bloc/wall_bloc_factory.dart';

extension WallModule on GetIt {
  List<Type> registerWallModule() => [
    provideSingleton<WallPostPagingSourceFactory>(() =>
      WallPostPagingSourceFactory(
        postRepository: this(),
        profileRepository: this(),
      ),
    ),
    provideSingleton<WallBlocFactory>(() =>
      WallBlocFactory(
        profileChangesUseCase: this(),
        pagingSourceFactory: this()
      ),
    ),
  ];
}
