import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/feature/root/component/mod.dart';

BottomNavigationBar MaterialRootNavBar({
  required AppTheme theme,
  required AppLocalizations strings,
  required RootState state,
  required void Function(Tabs tab) onTabClicked,
}) => BottomNavigationBar(
  backgroundColor: theme.colors.navBar.background,
  selectedItemColor: theme.colors.navBar.selected,
  unselectedItemColor: theme.colors.navBar.unselected,
  currentIndex: state.selectedTab.index,
  onTap: (index) => onTabClicked(Tabs.values[index]),
  items: _items(
    theme: theme,
    strings: strings,
    state: state,
    onTabClicked: onTabClicked,
  ),
);

CupertinoTabBar CupertinoRootNavBar({
  required AppTheme theme,
  required AppLocalizations strings,
  required RootState state,
  required void Function(Tabs tab) onTabClicked,
}) => CupertinoTabBar(
  backgroundColor: theme.colors.navBar.background,
  activeColor: theme.colors.navBar.selected,
  inactiveColor: theme.colors.navBar.unselected,
  currentIndex: state.selectedTab.index,
  onTap: (index) => onTabClicked(Tabs.values[index]),
  items: _items(
    theme: theme,
    strings: strings,
    state: state,
    onTabClicked: onTabClicked,
  ),
);

List<BottomNavigationBarItem> _items({
  required AppTheme theme,
  required AppLocalizations strings,
  required RootState state,
  required void Function(Tabs tab) onTabClicked,
}) => [
  BottomNavigationBarItem(
    icon: Image.asset(
      AppImages.loadPng('ic_wall'),
      width: theme.dimensions.size.small,
      height: theme.dimensions.size.small,
      color: state.selectedTab == Tabs.wall
          ? theme.colors.navBar.selected
          : theme.colors.navBar.unselected,
    ),
    label: strings.root_tab_wall,
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      AppImages.loadPng('ic_feed'),
      width: theme.dimensions.size.small,
      height: theme.dimensions.size.small,
      color: state.selectedTab == Tabs.feed
          ? theme.colors.navBar.selected
          : theme.colors.navBar.unselected,
    ),
    label: strings.root_tab_feed,
  ),
];
