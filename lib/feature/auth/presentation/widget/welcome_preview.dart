import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';

final class WelcomePreview extends StatelessWidget {
  const WelcomePreview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PreviewImage(theme: theme),
        SizedBox(height: theme.dimensions.padding.medium),
        WelcomeText(theme: theme, strings: strings),
      ],
    );
  }

  Widget PreviewImage({required AppTheme theme}) => Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(
      theme.dimensions.padding.zero,
      theme.dimensions.padding.enormous,
      theme.dimensions.padding.zero,
      theme.dimensions.padding.zero,
    ),
    child: Image.asset(
      AppImages.loadPng('auth_preview').value,
      width: theme.dimensions.size.extraLarge,
      height: theme.dimensions.size.extraLarge,
    ),
  );

  Widget WelcomeText({
    required AppTheme theme,
    required AppLocalizations strings,
  }) => Text(
    strings.auth_welcome,
    style: theme.typography.h.h1.copyWith(
      color: theme.colors.text.header,
      fontWeight: FontWeight.w700,
    ),
  );
}
