import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/theme/mod.dart';

final class PostShape extends StatelessWidget {
  final Widget child;
  const PostShape({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return Container(
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
        ),
      ),
      child: child,
    );
  }
}
