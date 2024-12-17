import 'package:flutter/cupertino.dart';
import 'package:poster/core/presentation/theme/colors.dart';
import 'package:poster/core/presentation/theme/dimensions.dart';
import 'package:poster/core/presentation/theme/typography.dart';

@immutable
class AppTheme {
  final AppColors colors;
  final AppDimensions dimensions;
  final AppTypography typography;

  const AppTheme({
    required this.colors,
    this.dimensions = const AppDimensions(),
    this.typography = const AppTypography(),
  });

  factory AppTheme.create() => AppTheme(colors: AppColors.create());
}
