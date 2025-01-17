import 'package:get_it/get_it.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/feature/feed/data/feed_post_paging_source_factory.dart';
import 'package:poster/feature/feed/presentation/bloc/feed_bloc_factory.dart';

extension FeedModule on GetIt {
  List<Type> registerFeedModule() => [
    provideSingleton<FeedPostPagingSourceFactory>(() =>
      FeedPostPagingSourceFactory(repository: this())
    ),
    provideSingleton<FeedBlocFactory>(() => FeedBlocFactory(
      profileChangesUseCase: this(),
      likeUseCase: this(),
      feedPostPagingSourceFactory: this(),
    )),
  ];
}
