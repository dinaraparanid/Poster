import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/feature/root/component/mod.dart';
import 'package:poster/feature/root/presentation/ui/mod.dart';
import 'package:poster/feature/wall/presentation/screen.dart';
import 'package:poster/utils/functions/do_nothing.dart';
import 'package:universal_platform/universal_platform.dart';

final class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => RootComponent(),
      child: BlocConsumer<RootComponent, RootState>(
        listenWhen: (x, y) => x.effect != y.effect,
        listener: (context, state) => onEffect(
          context: context,
          theme: theme,
          strings: strings,
          sendEnabled: state.isSendEnabled,
          effect: state.effect,
        ),
        builder: (context, state) {
          final onEvent = context.read<RootComponent>().add;

          return Scaffold(
            extendBody: true,
            backgroundColor: theme.colors.background.primary,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const NewMessageFab(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(theme.dimensions.size.big),
              child: const RootTopBar()
            ),
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
                  : materialUi(theme, strings, state, onEvent),
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
  ) => switch (state.selectedTab) {
    Tabs.wall => const WallScreen(),
    Tabs.feed => Text("TODO: Feed screen"),
  };

  void onEffect({
    required BuildContext context,
    required AppTheme theme,
    required AppLocalizations strings,
    required bool sendEnabled,
    required RootEffect? effect,
  }) {
    final onEvent = context.read<RootComponent>().add;

    switch (effect) {
      case ShowNewMessageDialog():
        onShowNewMessageDialog(
          context: context,
          theme: theme,
          strings: strings,
          onMessageChanged: (msg) => onEvent(UpdateMessage(message: msg)),
          onSend: () => onEvent(SendMessage()),
          onCancel: () => onEvent(UpdateNewMessageDialogVisibility(isVisible: false)),
        );

      case null: doNothing;
      case None(): doNothing;
    }
  }
}
