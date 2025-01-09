import 'package:poster/feature/feed/presentation/bloc/feed_bloc_factory.dart';
import 'package:poster/feature/main/domain/use_case/send_message_use_case.dart';
import 'package:poster/feature/main/domain/use_case/subscribe_on_incoming_announcements_use_case.dart';
import 'package:poster/core/domain/profile/use_case/subscribe_on_profile_changes_use_case.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc.dart';

final class MainBlocFactory {
  final SubscribeOnProfileChangesUseCase _profileChangesUseCase;
  final SubscribeOnIncomingAnnouncementsUseCase _incomingAnnouncementsUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final FeedBlocFactory _feedBlocFactory;

  MainBlocFactory({
    required SubscribeOnProfileChangesUseCase profileChangesUseCase,
    required SubscribeOnIncomingAnnouncementsUseCase incomingAnnouncementsUseCase,
    required SendMessageUseCase sendMessageUseCase,
    required FeedBlocFactory feedBlocFactory,
  }) : _profileChangesUseCase = profileChangesUseCase,
    _incomingAnnouncementsUseCase = incomingAnnouncementsUseCase,
    _sendMessageUseCase = sendMessageUseCase,
    _feedBlocFactory = feedBlocFactory;

  MainBloc create() => MainBloc(
    profileChangesUseCase: _profileChangesUseCase,
    incomingAnnouncementsUseCase: _incomingAnnouncementsUseCase,
    sendMessageUseCase: _sendMessageUseCase,
    feedBlocFactory: _feedBlocFactory,
  );
}
