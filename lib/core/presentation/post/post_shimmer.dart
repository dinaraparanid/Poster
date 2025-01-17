import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/post/post_shape.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:shimmer/shimmer.dart';

final class PostShimmer extends StatelessWidget {
  static const _height = 177.0;

  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return Shimmer.fromColors(
      baseColor: theme.colors.background.post,
      highlightColor: theme.colors.background.primary,
      child: const PostShape(
        child: SizedBox(
          width: double.infinity,
          height: _height,
        ),
      ),
    );
  }
}