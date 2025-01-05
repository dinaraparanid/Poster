import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/strings.dart';
import 'package:poster/core/utils/extension/string_ext.dart';
import 'package:poster/core/utils/functions/distinct_state.dart';
import 'package:poster/core/utils/functions/do_nothing.dart';
import 'package:poster/feature/feed/presentation/feed_screen.dart';
import 'package:poster/feature/main/presentation/bloc/mod.dart';
import 'package:poster/feature/main/presentation/widget/mod.dart';
import 'package:poster/feature/wall/presentation/wall_screen.dart';

final class MainScreen extends StatefulWidget {
  final MainBloc bloc;
  const MainScreen({super.key, required this.bloc});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

final class _MainScreenState extends State<MainScreen> {
  final dialogTextController = TextEditingController();

  void onEvent(MainEvent event) => widget.bloc.add(event);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = context.strings;

    return BlocProvider(
      create: (context) => widget.bloc,
      child: BlocConsumer<MainBloc, MainState>(
        listenWhen: distinctState((x) => x.effect),
        listener: (context, state) => onEffect(
          context: context,
          effect: state.effect,
        ),
        builder: (context, state) => Scaffold(
          extendBody: true,
          backgroundColor: theme.colors.background.primary,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: NewMessageFab(onEvent: onEvent),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(theme.dimensions.size.big),
            child: MainTopBar(onEvent: onEvent),
          ),
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
              child: PlatformUi(cupertino: CupertinoUi, material: MaterialUi)(
                theme: theme,
                strings: strings,
                state: state,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget MaterialUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required MainState state,
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
    required MainEffect? effect,
  }) {
    switch (effect) {
      case ShowNewMessageDialog():
        showNewMessageDialog(
          controller: dialogTextController,
          context: context,
          canSend: () => dialogTextController.text.isNotBlank,
          onMessageChanged: (msg) => onEvent(UpdateMessage(message: msg)),
          onMessageCleared: () => onEvent(ClearMessage()),
          onSend: () => onEvent(SendMessage()),
          onCancel: () => onEvent(UpdateNewMessageDialogVisibility(isVisible: false)),
        );

      case ShowSendMessageFailureSnackbar(): doNothing; // TODO
      case ShowSendMessageSuccessSnackbar(): doNothing; // TODO
      case null: doNothing;
    }
  }
}
