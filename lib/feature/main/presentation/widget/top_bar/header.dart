import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/core/presentation/theme/strings.dart';
import 'package:poster/feature/main/presentation/bloc/mod.dart';

final class MainTopBarHeader extends StatelessWidget {
  const MainTopBarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = context.strings;

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) => switch (state.selectedTab) {
        Tabs.wall => Container(),
        Tabs.feed => FeedHeader(theme: theme, strings: strings),
      },
    );
  }

  Widget FeedHeader({
    required AppTheme theme,
    required AppLocalizations strings,
  }) => Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        AppImages.loadPng('feed').value,
        width: theme.dimensions.size.medium,
        height: theme.dimensions.size.medium,
        color: theme.colors.text.header,
      ),

      SizedBox(width: theme.dimensions.padding.small),

      Text(
        strings.main_tab_feed,
        style: theme.typography.h.h2.copyWith(
          color: theme.colors.text.header,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
