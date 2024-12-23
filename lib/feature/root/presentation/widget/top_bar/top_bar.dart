import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/clickable.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/root/presentation/bloc/mod.dart';
import 'package:poster/feature/root/presentation/widget/mod.dart';
import 'package:universal_platform/universal_platform.dart';

final class RootTopBar extends StatelessWidget {
  const RootTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = di<RootBloc>();
    final theme = di<AppTheme>();

    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        final hasIncoming = state.hasIncomingAnnouncements;
        void onClick() => bloc.add(AnnouncementsClicked());

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
      AppImages.loadPng(hasIncoming ? 'ic_bell_incoming' : 'ic_bell').value,
      width: theme.dimensions.size.small,
      height: theme.dimensions.size.small,
    ),
  );
}
