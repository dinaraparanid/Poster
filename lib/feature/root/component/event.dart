import 'package:poster/feature/root/component/state.dart';

sealed class RootEvent {}

final class TabClicked extends RootEvent {
  final Tabs tab;
  TabClicked({required this.tab});
}

final class NewMessageButtonClicked extends RootEvent {}
