import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/presentation/foundation/clickable.dart';
import 'package:poster/core/presentation/foundation/profile_cover_stub.dart';
import 'package:poster/core/presentation/post/post_shape.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';

final class PostItem extends StatelessWidget {
  final Post post;
  final void Function() onLike;
  final void Function() onShare;

  const PostItem({
    super.key,
    required this.post,
    required this.onLike,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return PostShape(
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
  }

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
        ),
      ),

      SizedBox(width: theme.dimensions.padding.medium),

      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.data.author,
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
    post.data.text,
    style: theme.typography.body.copyWith(
      color: theme.colors.text.primary,
    ),
  );

  Widget ActionsRow({required AppTheme theme}) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      AppClickable(
        onClick: onShare,
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
