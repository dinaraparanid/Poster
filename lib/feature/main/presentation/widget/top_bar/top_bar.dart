import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/clickable.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/feature/main/presentation/bloc/mod.dart';
import 'package:poster/feature/main/presentation/widget/mod.dart';

final class MainTopBar extends StatelessWidget {
  final void Function(MainEvent) onEvent;
  const MainTopBar({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) =>
        PlatformUi(cupertino: CupertinoUi, material: MaterialUi)(
          hasIncoming: state.hasIncomingAnnouncements,
          theme: theme,
          onClick: () => onEvent(AnnouncementsClicked()),
        ),
    );
  }

  Widget MaterialUi({
    required bool hasIncoming,
    required AppTheme theme,
    required void Function() onClick,
  }) => AppBar(
    title: const MainTopBarHeader(),
    centerTitle: true,
    backgroundColor: theme.colors.background.primary,
    scrolledUnderElevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: theme.colors.navBar.background,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
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
    middle: const MainTopBarHeader(),
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
