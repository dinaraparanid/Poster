import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/core/presentation/theme/strings.dart';

final class AppEmptyStub extends StatelessWidget {
  static const _stubHeight = 320.0;

  const AppEmptyStub({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = context.strings;

    return Column(
      children: [
        Image.asset(
          AppImages.loadGif('anim_bird_empty_stub').value,
          height: _stubHeight,
        ),

        SizedBox(height: theme.dimensions.padding.medium),

        Text(
          strings.stub_empty_title,
          style: theme.typography.h.h2.copyWith(
            color: theme.colors.text.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
