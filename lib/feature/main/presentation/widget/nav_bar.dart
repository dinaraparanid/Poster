import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/feature/main/presentation/bloc/mod.dart';

BottomNavigationBar MaterialMainNavBar({
  required AppTheme theme,
  required AppLocalizations strings,
  required MainState state,
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

CupertinoTabBar CupertinoMainNavBar({
  required AppTheme theme,
  required AppLocalizations strings,
  required MainState state,
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
  required MainState state,
  required void Function(Tabs tab) onTabClicked,
}) => [
  BottomNavigationBarItem(
    icon: Image.asset(
      AppImages.loadPng('ic_wall').value,
      width: theme.dimensions.size.small,
      height: theme.dimensions.size.small,
      color: state.selectedTab == Tabs.wall
        ? theme.colors.navBar.selected
        : theme.colors.navBar.unselected,
    ),
    label: strings.main_tab_wall,
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      AppImages.loadPng('ic_feed').value,
      width: theme.dimensions.size.small,
      height: theme.dimensions.size.small,
      color: state.selectedTab == Tabs.feed
        ? theme.colors.navBar.selected
        : theme.colors.navBar.unselected,
    ),
    label: strings.main_tab_feed,
  ),
];
