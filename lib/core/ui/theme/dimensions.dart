import 'package:flutter/cupertino.dart';

@immutable
final class AppDimensions {
  final AppPadding padding;
  final AppRadius radius;
  final AppSize size;

  const AppDimensions({
    this.padding = const AppPadding(),
    this.radius = const AppRadius(),
    this.size = const AppSize()
  });
}

@immutable
final class AppPadding {
  final double zero;
  final double minimum;
  final double extraSmall;
  final double small;
  final double medium;
  final double extraMedium;
  final double big;
  final double extraBig;
  final double large;
  final double extraLarge;
  final double enormous;
  final double extraEnormous;

  const AppPadding({
    this.zero = 0.0,
    this.minimum = 2.0,
    this.extraSmall = 4.0,
    this.small = 8.0,
    this.medium = 12.0,
    this.extraMedium = 16.0,
    this.big = 20.0,
    this.extraBig = 24.0,
    this.large = 32.0,
    this.extraLarge = 48.0,
    this.enormous = 64.0,
    this.extraEnormous = 128.0
  });
}

@immutable
final class AppRadius {
  final double minimum;
  final double extraSmall;
  final double small;
  final double medium;
  final double extraMedium;

  const AppRadius({
    this.minimum = 4.0,
    this.extraSmall = 8.0,
    this.small = 16.0,
    this.medium = 20.0,
    this.extraMedium = 24.0,
  });
}

@immutable
final class AppSize {
  final double minimum;
  final double extraSmall;
  final double small;
  final double medium;
  final double extraMedium;
  final double big;
  final double extraBig;
  final double large;
  final double extraLarge;
  final double enormous;
  final AppLineSize line;

  const AppSize({
    this.minimum = 15.0,
    this.extraSmall = 30.0,
    this.small = 50.0,
    this.medium = 100.0,
    this.extraMedium = 150.0,
    this.big = 200.0,
    this.extraBig = 250.0,
    this.large = 300.0,
    this.extraLarge = 400.0,
    this.enormous = 500.0,
    this.line = const AppLineSize(),
  });
}

@immutable
final class AppLineSize {
  final double minimum;
  final double extraSmall;
  final double small;
  final double medium;
  final double extraMedium;
  final double big;
  final double extraBig;
  final double large;
  final double extraLarge;
  final double enormous;

  const AppLineSize({
    this.minimum = 0.5,
    this.extraSmall = 1,
    this.small = 2,
    this.medium = 4,
    this.extraMedium = 8,
    this.big = 12,
    this.extraBig = 16,
    this.large = 20,
    this.extraLarge = 24,
    this.enormous = 32,
  });
}
