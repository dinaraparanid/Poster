import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/utils/functions/do_nothing.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/feed/presentation/feed_screen.dart';
import 'package:poster/feature/root/presentation/bloc/mod.dart';
import 'package:poster/feature/root/presentation/widget/mod.dart';
import 'package:poster/feature/wall/presentation/wall_screen.dart';
import 'package:universal_platform/universal_platform.dart';

final class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RootScreenState();
}

final class _RootScreenState extends State<RootScreen> {
  final bloc = di<RootBloc>(); // TODO Factory
  final dialogTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<RootBloc, RootState>(
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
              child: const RootTopBar(),
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
    required RootState state,
    required void Function(RootEvent) onEvent,
  }) => MaterialRootNavBar(
    theme: theme,
    strings: strings,
    state: state,
    onTabClicked: (tab) => onEvent(TabClicked(tab: tab)),
  );

  Widget CupertinoUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required RootState state,
    required void Function(RootEvent) onEvent,
  }) => CupertinoRootNavBar(
    theme: theme,
    strings: strings,
    state: state,
    onTabClicked: (tab) => onEvent(TabClicked(tab: tab)),
  );

  Widget Body(RootState state) => switch (state.selectedTab) {
    Tabs.wall => WallScreen(),
    Tabs.feed => FeedScreen(),
  };

  void onEffect({
    required BuildContext context,
    required bool sendEnabled,
    required RootEffect? effect,
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
