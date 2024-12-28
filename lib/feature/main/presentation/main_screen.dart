import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/utils/functions/do_nothing.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/feed/presentation/feed_screen.dart';
import 'package:poster/feature/main/presentation/bloc/mod.dart';
import 'package:poster/feature/main/presentation/widget/mod.dart';
import 'package:poster/feature/wall/presentation/wall_screen.dart';
import 'package:universal_platform/universal_platform.dart';

final class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

final class _MainScreenState extends State<MainScreen> {
  final bloc = di<MainBloc>(); // TODO Factory
  final dialogTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<MainBloc, MainState>(
          listenWhen: (x, y) => x.effect != y.effect,
          listener: (context, state) => onEffect(
            context: context,
            sendEnabled: state.isSendEnabled,
            effect: state.effect,
          ),
          builder: (context, state) => Scaffold(
            extendBody: true,
            backgroundColor: theme.colors.background.primary,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const NewMessageFab(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(theme.dimensions.size.big),
              child: const MainTopBar(),
            ),
            body: Body(state),
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
                child: (UniversalPlatform.isIOS || UniversalPlatform.isMacOS ? CupertinoUi : MaterialUi)(
                  theme: theme,
                  strings: strings,
                  state: state,
                  onEvent: bloc.add,
                ),
              ),
            ),
          )
      ),
    );
  }

  Widget MaterialUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required MainState state,
    required void Function(MainEvent) onEvent,
  }) => MaterialMainNavBar(
    theme: theme,
    strings: strings,
    state: state,
    onTabClicked: (tab) => onEvent(TabClicked(tab: tab)),
  );

  Widget CupertinoUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required MainState state,
    required void Function(MainEvent) onEvent,
  }) => CupertinoMainNavBar(
    theme: theme,
    strings: strings,
    state: state,
    onTabClicked: (tab) => onEvent(TabClicked(tab: tab)),
  );

  Widget Body(MainState state) => switch (state.selectedTab) {
    Tabs.wall => WallScreen(),
    Tabs.feed => FeedScreen(),
  };

  void onEffect({
    required BuildContext context,
    required bool sendEnabled,
    required MainEffect? effect,
  }) {
    switch (effect) {
      case ShowNewMessageDialog():
        showNewMessageDialog(
          controller: dialogTextController,
          context: context,
          onMessageChanged: (msg) => bloc.add(UpdateMessage(message: msg)),
          onSend: () => bloc.add(SendMessage()),
          onCancel: () => bloc.add(UpdateNewMessageDialogVisibility(isVisible: false)),
        );

      case null: doNothing;
      case None(): doNothing;
    }
  }
}
