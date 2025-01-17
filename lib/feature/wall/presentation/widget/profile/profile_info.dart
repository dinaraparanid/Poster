import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/core/presentation/theme/strings.dart';
import 'package:poster/feature/wall/presentation/bloc/mod.dart';
import 'package:shimmer/shimmer.dart';

const _transitionDuration = Duration(seconds: 1);
const _topPadding = 80.0;
const _dividerWidth = 1.0;
const _dividerHeight = 24.0;

final class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = context.strings;

    return BlocBuilder<WallBloc, WallState>(
      builder: (context, state) {
        final profileState = state.profileState;
        final profile = profileState.getOrNull;

        return AnimatedContainer(
          duration: _transitionDuration,
          child: profile == null
            ? ShimmerStub(theme)
            : Content(theme: theme, strings: strings, profile: profile),
        );
      }
    );
  }

  Widget Content({
    required AppTheme theme,
    required AppLocalizations strings,
    required Profile profile,
  }) => Container(
    constraints: BoxConstraints(
      maxWidth: theme.dimensions.size.extraEnormous,
    ),
    padding: EdgeInsets.only(
      top: _topPadding,
      left: theme.dimensions.padding.medium,
      right: theme.dimensions.padding.medium,
      bottom: theme.dimensions.padding.medium,
    ),
    margin: EdgeInsets.symmetric(
      horizontal: theme.dimensions.padding.medium,
    ),
    decoration: BoxDecoration(
      gradient: theme.colors.gradient.profileCard,
      borderRadius: BorderRadius.all(
        Radius.circular(theme.dimensions.radius.small),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FirstRow(theme: theme, strings: strings, profile: profile),
        SizedBox(height: theme.dimensions.padding.small),
        SecondRow(theme: theme, strings: strings, profile: profile),
      ],
    ),
  );

  Widget FirstRow({
    required AppTheme theme,
    required AppLocalizations strings,
    required Profile profile,
  }) => IntrinsicWidth(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            profile.age != null
              ? strings.wall_age(profile.age!)
              : strings.wall_age_undefined,
            style: theme.typography.regular.copyWith(
              color: theme.colors.text.onCard,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),

        Divider(theme),

        Expanded(
          child: Text(
            profile.username,
            style: theme.typography.h.h3.copyWith(
              color: theme.colors.text.onCard,
              fontWeight: FontWeight.w900,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        Divider(theme),

        Expanded(
          child: Text(
            strings.wall_edit_profile,
            style: theme.typography.regular.copyWith(
              color: theme.colors.text.onCard,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );

  Widget SecondRow({
    required AppTheme theme,
    required AppLocalizations strings,
    required Profile profile,
  }) => IntrinsicWidth(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            strings.wall_followers(0), // TODO: followers
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: theme.typography.caption.copyWith(
              color: theme.colors.text.onCard,
            ),
          ),
        ),

        Expanded(
          child: Text(
            strings.wall_following(0), // TODO: following
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: theme.typography.caption.copyWith(
              color: theme.colors.text.onCard,
            ),
          ),
        ),

        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.loadPng('ic_location').value,
                width: theme.dimensions.size.extraSmall,
                height: theme.dimensions.size.extraSmall,
                color: theme.colors.text.onCard,
              ),

              SizedBox(width: theme.dimensions.padding.minimum),

              Text(
                profile.location ?? strings.unspecified,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: theme.typography.caption.copyWith(
                  color: theme.colors.text.onCard,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget Divider(AppTheme theme) => Padding(
    padding: EdgeInsets.symmetric(horizontal: theme.dimensions.padding.small),
    child: Container(
      width: _dividerWidth,
      height: _dividerHeight,
      decoration: BoxDecoration(
        color: theme.colors.background.divider,
        borderRadius: BorderRadius.all(
          Radius.circular(theme.dimensions.radius.extraSmall),
        ),
      ),
    ),
  );

  Widget ShimmerStub(AppTheme theme) => Container(
    width: theme.dimensions.size.extraEnormous,
    height: theme.dimensions.size.large,
    padding: EdgeInsets.only(
      left: theme.dimensions.padding.medium,
      right: theme.dimensions.padding.medium,
    ),
    child: Shimmer.fromColors(
      baseColor: theme.colors.gradient.profileCard.colors[1],
      highlightColor: theme.colors.gradient.profileCard.colors[0],
      child: Container(
        height: theme.dimensions.size.extraEnormous,
        width: theme.dimensions.size.large,
        padding: EdgeInsets.only(
          top: _topPadding,
          left: theme.dimensions.padding.medium,
          right: theme.dimensions.padding.medium,
          bottom: theme.dimensions.padding.medium,
        ),
        decoration: BoxDecoration(
          gradient: theme.colors.gradient.profileCard,
          borderRadius: BorderRadius.all(
            Radius.circular(theme.dimensions.radius.small),
          ),
        ),
      ),
    ),
  );
}
