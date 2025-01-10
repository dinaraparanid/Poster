import 'package:get_it/get_it.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/feature/main/domain/use_case/send_message_use_case.dart';
import 'package:poster/feature/main/domain/use_case/subscribe_on_incoming_announcements_use_case.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc_factory.dart';

extension MainModule on GetIt {
  List<Type> registerMainModule() => [
    provideSingleton<SubscribeOnIncomingAnnouncementsUseCase>(
      () => SubscribeOnIncomingAnnouncementsUseCase(repository: this()),
    ),
    provideSingleton<SendMessageUseCase>(
      () => SendMessageUseCase(postRepository: this()),
    ),
    provideSingleton<MainBlocFactory>(() => MainBlocFactory(
      profileChangesUseCase: this(),
      incomingAnnouncementsUseCase: this(),
      sendMessageUseCase: this(),
      feedBlocFactory: this(),
      wallBlocFactory: this(),
    )),
  ];
}
