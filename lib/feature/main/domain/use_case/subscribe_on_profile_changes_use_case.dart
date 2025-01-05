import 'dart:async';

import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';

final class SubscribeOnProfileChangesUseCase {
  final ProfileRepository _profileRepository;

  SubscribeOnProfileChangesUseCase({
    required ProfileRepository profileRepository
  }) : _profileRepository = profileRepository;

  StreamSubscription<UiState<Profile>> subscribe({
    required void Function(UiState<Profile> profileState) onChanged,
  }) => _profileRepository
    .profileChanges
    .map((profile) => profile == null ? const UiState<Profile>.loading() : profile.toUiState())
    .distinct()
    .listen(onChanged);
}
