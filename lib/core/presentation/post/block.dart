import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/presentation/foundation/clickable.dart';
import 'package:poster/core/presentation/foundation/profile_cover_stub.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/di/app_module.dart';

final class PostBlock extends StatelessWidget {
  final theme = di<AppTheme>();

  final Post post;
  final void Function() onLike;

  PostBlock({
    super.key,
    required this.post,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    constraints: BoxConstraints(
      maxWidth: theme.dimensions.size.extraEnormous,
    ),
    padding: EdgeInsets.only(
      top: theme.dimensions.padding.medium,
      left: theme.dimensions.padding.medium,
      right: theme.dimensions.padding.medium,
    ),
    decoration: BoxDecoration(
      color: theme.colors.background.post,
      borderRadius: BorderRadius.all(
        Radius.circular(theme.dimensions.radius.small),
      )
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoRow(theme: theme),

        SizedBox(height: theme.dimensions.size.extraSmall),

        PostText(theme: theme),

        SizedBox(height: theme.dimensions.size.extraSmall),

        ActionsRow(theme: theme),
      ],
    ),
  );

  Widget InfoRow({required AppTheme theme}) => Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ProfileCoverStub(
        shape: BoxShape.circle,
        color: theme.colors.background.avatarPlaceholder,
        containerSize: Size(
          theme.dimensions.size.extraMedium,
          theme.dimensions.size.extraMedium,
        ),
        avatarSize: Size(
          theme.dimensions.size.small,
          theme.dimensions.size.small,
        )
      ),

      SizedBox(width: theme.dimensions.padding.medium),

      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.author,
            style: theme.typography.body.copyWith(
              color: theme.colors.text.primary,
            ),
          ),

          SizedBox(height: theme.dimensions.padding.extraSmall),

          Text(
            post.formattedCreateTime,
            style: theme.typography.caption.copyWith(
              color: theme.colors.text.primary,
            ),
          ),
        ],
      ),
    ],
  );

  Widget PostText({required AppTheme theme}) => Text(
    post.text,
    style: theme.typography.body.copyWith(
      color: theme.colors.text.primary,
    ),
  );

  Widget ActionsRow({
    required AppTheme theme,
  }) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AppClickable(
        onClick: () => print('TODO: Share'),
        border: const CircleBorder(),
        child: Image.asset(
          AppImages.loadPng('ic_share').value,
          width: theme.dimensions.size.small,
          height: theme.dimensions.size.small,
        ),
      ),

      AppClickable(
        onClick: onLike,
        rippleColor: theme.colors.button.like,
        border: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(theme.dimensions.radius.small)
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.loadPng('ic_like').value,
              width: theme.dimensions.size.small,
              height: theme.dimensions.size.small,
            ),

            SizedBox(width: theme.dimensions.padding.extraSmall),

            Text(
              post.formattedLikeCount,
              style: theme.typography.body.copyWith(
                color: theme.colors.text.primary,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
