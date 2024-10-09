import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/clickable.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/core/ui/theme/images.dart';
import 'package:poster/feature/root/component/mod.dart';
import 'package:poster/feature/root/presentation/ui/mod.dart';
import 'package:universal_platform/universal_platform.dart';

final class RootTopBar extends StatelessWidget {
  const RootTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocBuilder<RootComponent, RootState>(
      builder: (context, state) {
        final onEvent = context.read<RootComponent>().add;
        void onClick() => onEvent(AnnouncementsClicked());
        final hasIncoming = state.hasIncomingAnnouncements;

        return UniversalPlatform.isIOS || UniversalPlatform.isMacOS
          ? CupertinoUi(hasIncoming: hasIncoming, theme: theme, onClick: onClick)
          : MaterialUi(hasIncoming: hasIncoming, theme: theme, onClick: onClick);
      },
    );
  }

  Widget MaterialUi({
    required bool hasIncoming,
    required AppTheme theme,
    required void Function() onClick,
  }) => AppBar(
    title: const RootTopBarHeader(),
    centerTitle: true,
    backgroundColor: theme.colors.background.primary,
    scrolledUnderElevation: 0.0,
    actions: [
      AnnouncementsIcon(
        hasIncoming: hasIncoming,
        theme: theme,
        onClick: onClick,
      ),
    ],
  );

  Widget CupertinoUi({
    required bool hasIncoming,
    required AppTheme theme,
    required void Function() onClick,
  }) => CupertinoNavigationBar(
    backgroundColor: theme.colors.background.primary,
    middle: const RootTopBarHeader(),
    trailing: AnnouncementsIcon(
      hasIncoming: hasIncoming,
      theme: theme,
      onClick: onClick,
    ),
  );

  Widget AnnouncementsIcon({
    required bool hasIncoming,
    required AppTheme theme,
    required void Function() onClick,
  }) => AppClickable(
    onClick: onClick,
    border: const CircleBorder(),
    child: Image.asset(
      AppImages.loadPng(hasIncoming ? 'ic_bell_incoming' : 'ic_bell'),
      width: theme.dimensions.size.small,
      height: theme.dimensions.size.small,
    ),
  );
}
