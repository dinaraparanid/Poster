import 'package:get_it/get_it.dart';
import 'package:poster/core/data/image/image_repository_impl.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/core/domain/image/image_repository.dart';

extension ImageModule on GetIt {
  List<Type> registerImageModule() => [
    provideSingleton<ImageRepository>(() => ImageRepositoryImpl(client: this())),
  ];
}
