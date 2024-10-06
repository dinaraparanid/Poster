import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/feature/root/component/mod.dart';
import 'package:poster/feature/root/presentation/ui/mod.dart';
import 'package:poster/feature/root/presentation/ui/new_message_fab.dart';
import 'package:universal_platform/universal_platform.dart';

final class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => RootComponent(),
      child: BlocBuilder<RootComponent, RootState>(
        builder: (context, state) {
          final onEvent = context.read<RootComponent>().add;

          return Scaffold(
            extendBody: true,
            backgroundColor: theme.colors.background.primary,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const NewMessageFab(),
            body: body(theme, strings, state, onEvent),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(theme.dimensions.radius.small),
                  topRight: Radius.circular(theme.dimensions.radius.small),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(theme.dimensions.radius.small),
                  topRight: Radius.circular(theme.dimensions.radius.small),
                ),
                child: UniversalPlatform.isIOS || UniversalPlatform.isMacOS
                    ? cupertinoUi(theme, strings, state, onEvent)
                    : materialUi(theme, strings, state, onEvent)
              ),
            ),
          );
        }
      ),
    );
  }

  Widget materialUi(
    AppTheme theme,
    AppLocalizations strings,
    RootState state,
    void Function(RootEvent) onEvent,
  ) => MaterialRootNavBar(
    theme: theme,
    strings: strings,
    state: state,
    onTabClicked: (tab) => onEvent(TabClicked(tab: tab)),
  );

  Widget cupertinoUi(
    AppTheme theme,
    AppLocalizations strings,
    RootState state,
    void Function(RootEvent) onEvent,
  ) => CupertinoRootNavBar(
    theme: theme,
    strings: strings,
    state: state,
    onTabClicked: (tab) => onEvent(TabClicked(tab: tab)),
  );

  Widget body(
    AppTheme theme,
    AppLocalizations strings,
    RootState state,
    void Function(RootEvent) onEvent,
  ) => Text('TODO: Body');
}
