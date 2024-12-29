import 'package:get_it/get_it.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc_factory.dart';

extension MainModule on GetIt {
  List<Type> registerMainModule() => [
    provideSingleton<MainBlocFactory>(() => MainBlocFactory()),
  ];
}
