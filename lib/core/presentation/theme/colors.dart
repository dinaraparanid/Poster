import 'package:flutter/cupertino.dart';

const _ChineseBlack = Color(0xFF0A1310);
const _GhostWhite = Color(0xFFF0F2F9);
const _Cultured = Color(0xFFF4F4F8);
const _ColumbiaBlue = Color(0xFFBFDBF7);
const _Aquamarine = Color(0xFF76E7CD);
const _DarkRaspberry = Color(0xFF832161);
const _MoonstoneBlue = Color(0xFF6FABC2);
const _Gunmetal = Color(0xFF022B3A);
const _MetallicSeaweed = Color(0xFF1F7A8C);
const _DarkJungleGreen = Color(0xFF082126);
const _Lavender = Color.fromRGBO(225, 229, 242, 0.5);
const _Shadow = Color.fromRGBO(0, 0, 0, 0.25);

@immutable
final class AppColors {
  final AppBackgroundColors background;
  final AppTextColors text;
  final AppButtonColors button;
  final AppTextFieldColors textField;
  final AppProgressIndicatorColor indicator;
  final AppNavBarColors navBar;
  final AppGradient gradient;
  final Color shadow;

  const AppColors({
    required this.background,
    required this.text,
    required this.button,
    required this.textField,
    required this.indicator,
    required this.navBar,
    required this.gradient,
    required this.shadow,
  });

  factory AppColors.create() => AppColors(
    background: AppBackgroundColors._default(),
    text: AppTextColors._default(),
    button: AppButtonColors._default(),
    textField: AppTextFieldColors._default(),
    indicator: AppProgressIndicatorColor._default(),
    navBar: AppNavBarColors._default(),
    gradient: AppGradient._default(),
    shadow: _Shadow,
  );
}

@immutable
final class AppBackgroundColors {
  final Color primary;
  final Color post;
  final Color divider;
  final Color avatarPlaceholder;

  const AppBackgroundColors({
    required this.primary,
    required this.post,
    required this.divider,
    required this.avatarPlaceholder,
  });

  factory AppBackgroundColors._default() => const AppBackgroundColors(
    primary: _GhostWhite,
    post: _ColumbiaBlue,
    divider: _Lavender,
    avatarPlaceholder: _MoonstoneBlue,
  );
}

@immutable
final class AppNavBarColors {
  final Color background;
  final Color selected;
  final Color unselected;

  const AppNavBarColors({
    required this.background,
    required this.selected,
    required this.unselected,
  });

  factory AppNavBarColors._default() => const AppNavBarColors(
    background: _Gunmetal,
    selected: _Aquamarine,
    unselected: _ColumbiaBlue,
  );
}

@immutable
final class AppTextColors {
  final Color header;
  final Color primary;
  final Color onCard;
  final Color onButton;
  final Color clickable;

  const AppTextColors({
    required this.header,
    required this.primary,
    required this.onCard,
    required this.onButton,
    required this.clickable,
  });

  factory AppTextColors._default() => const AppTextColors(
    header: _DarkRaspberry,
    primary: _ChineseBlack,
    onCard: _Cultured,
    onButton: _Cultured,
    clickable: _MoonstoneBlue,
  );
}

@immutable
final class AppButtonColors {
  final Color primary;
  final Color ripple;
  final Color like;
  final Color disabled;
  final Color topBar;
  final AppFabColors fab;

  const AppButtonColors({
    required this.primary,
    required this.ripple,
    required this.like,
    required this.disabled,
    required this.topBar,
    required this.fab,
  });

  factory AppButtonColors._default() => AppButtonColors(
    primary: _MetallicSeaweed,
    ripple: _MetallicSeaweed.withValues(alpha: 0.25),
    like: _DarkRaspberry.withValues(alpha: 0.25),
    disabled: _DarkJungleGreen,
    topBar: _ChineseBlack,
    fab: AppFabColors._default(),
  );
}

@immutable
final class AppTextFieldColors {
  final Color primary;

  const AppTextFieldColors({
    required this.primary,
  });

  factory AppTextFieldColors._default() => const AppTextFieldColors(
    primary: _MetallicSeaweed,
  );
}

@immutable
final class AppFabColors {
  final Color content;
  final Color background;

  const AppFabColors({
    required this.content,
    required this.background,
  });

  factory AppFabColors._default() => const AppFabColors(
      content: _ChineseBlack,
      background: _Aquamarine,
  );
}

@immutable
final class AppProgressIndicatorColor {
  final Color primary;
  final Color background;

  const AppProgressIndicatorColor({
    required this.primary,
    required this.background,
  });

  factory AppProgressIndicatorColor._default() => const AppProgressIndicatorColor(
    primary: _Aquamarine,
    background: _Gunmetal,
  );
}

@immutable
final class AppGradient {
  final LinearGradient profileCard;

  const AppGradient({
    required this.profileCard
  });

  factory AppGradient._default() => const AppGradient(
      profileCard: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [_MetallicSeaweed, _DarkJungleGreen],
      ),
  );
}
