import 'package:poster/feature/feed/presentation/bloc/feed_bloc_factory.dart';
import 'package:poster/feature/main/domain/use_case/send_message_use_case.dart';
import 'package:poster/feature/main/domain/use_case/subscribe_on_incoming_announcements_use_case.dart';
import 'package:poster/core/domain/profile/use_case/subscribe_on_profile_changes_use_case.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc.dart';
import 'package:poster/feature/wall/presentation/bloc/wall_bloc_factory.dart';

final class MainBlocFactory {
  final SubscribeOnProfileChangesUseCase _profileChangesUseCase;
  final SubscribeOnIncomingAnnouncementsUseCase _incomingAnnouncementsUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final FeedBlocFactory _feedBlocFactory;
  final WallBlocFactory _wallBlocFactory;

  MainBlocFactory({
    required SubscribeOnProfileChangesUseCase profileChangesUseCase,
    required SubscribeOnIncomingAnnouncementsUseCase incomingAnnouncementsUseCase,
    required SendMessageUseCase sendMessageUseCase,
    required FeedBlocFactory feedBlocFactory,
    required WallBlocFactory wallBlocFactory,
  }) : _profileChangesUseCase = profileChangesUseCase,
    _incomingAnnouncementsUseCase = incomingAnnouncementsUseCase,
    _sendMessageUseCase = sendMessageUseCase,
    _feedBlocFactory = feedBlocFactory,
    _wallBlocFactory = wallBlocFactory;

  MainBloc create() => MainBloc(
    profileChangesUseCase: _profileChangesUseCase,
    incomingAnnouncementsUseCase: _incomingAnnouncementsUseCase,
    sendMessageUseCase: _sendMessageUseCase,
    feedBlocFactory: _feedBlocFactory,
    wallBlocFactory: _wallBlocFactory,
  );
}
