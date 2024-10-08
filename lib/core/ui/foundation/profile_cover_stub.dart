import 'package:flutter/cupertino.dart';
import 'package:poster/core/ui/theme/images.dart';

final class ProfileCoverStub extends StatelessWidget {
  final BoxShape shape;
  final Color color;
  final Size containerSize;
  final Size avatarSize;
  final Border? border;
  final BorderRadius? borderRadius;
  final BoxShadow? shadow;

  const ProfileCoverStub({
    super.key,
    required this.shape,
    required this.color,
    required this.containerSize,
    required this.avatarSize,
    this.border,
    this.borderRadius,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: containerSize.width,
    height: containerSize.height,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
      border: border,
      borderRadius: borderRadius,
      boxShadow: shadow == null ? null : [shadow!],
      shape: shape,
    ),
    child: Wrap(
      children: [
        Image.asset(
          AppImages.loadPng('ic_avatar'),
          width: avatarSize.width,
          height: avatarSize.height,
        )
      ],
    ),
  );
}