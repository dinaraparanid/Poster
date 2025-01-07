import 'package:poster/feature/main/domain/use_case/send_message_use_case.dart';
import 'package:poster/feature/main/domain/use_case/subscribe_on_incoming_announcements_use_case.dart';
import 'package:poster/feature/main/domain/use_case/subscribe_on_profile_changes_use_case.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc.dart';

final class MainBlocFactory {
  final SubscribeOnProfileChangesUseCase _profileChangesUseCase;
  final SubscribeOnIncomingAnnouncementsUseCase _incomingAnnouncementsUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  MainBlocFactory({
    required SubscribeOnProfileChangesUseCase profileChangesUseCase,
    required SubscribeOnIncomingAnnouncementsUseCase incomingAnnouncementsUseCase,
    required SendMessageUseCase sendMessageUseCase,
  }) : _profileChangesUseCase = profileChangesUseCase,
    _incomingAnnouncementsUseCase = incomingAnnouncementsUseCase,
    _sendMessageUseCase = sendMessageUseCase;

  MainBloc create() => MainBloc(
    profileChangesUseCase: _profileChangesUseCase,
    incomingAnnouncementsUseCase: _incomingAnnouncementsUseCase,
    sendMessageUseCase: _sendMessageUseCase,
  );
}
