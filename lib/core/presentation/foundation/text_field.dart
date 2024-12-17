import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:universal_platform/universal_platform.dart';

const _cancelIconAnimDuration = Duration(milliseconds: 100);

final class AppTextField extends StatefulWidget {
  final String label;
  final void Function(String) onChanged;
  final void Function()? onCanceled;

  const AppTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.onCanceled,
  });

  @override
  State<StatefulWidget> createState() => _AppTextField();
}

final class _AppTextField extends State<AppTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return UniversalPlatform.isIOS || UniversalPlatform.isMacOS
      ? cupertinoUi(theme)
      : materialUi(theme);
  }

  Widget materialUi(AppTheme theme) => TextField(
    controller: _controller,
    style: theme.typography.body.copyWith(
      color: theme.colors.text.primary
    ),
    cursorColor: theme.colors.textField.primary,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: theme.dimensions.padding.medium,
        horizontal: theme.dimensions.padding.medium,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.colors.textField.primary,
          width: theme.dimensions.size.line.small,
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.colors.textField.primary,
         )
      ),
      labelText: widget.label,
      labelStyle: theme.typography.regular.copyWith(
        color: theme.colors.textField.primary
      ),
      suffixIcon: AnimatedOpacity(
        opacity: _controller.text.isEmpty ? 0.0 : 1.0,
        duration: _cancelIconAnimDuration,
        child: Container(
          margin: EdgeInsets.only(right: theme.dimensions.padding.medium),
          child: cancelIcon(theme),
        ),
      ),
      suffixIconConstraints: BoxConstraints.expand(
        width: theme.dimensions.size.medium,
        height: theme.dimensions.size.small,
      )
    ),
    onChanged: widget.onChanged,
  );

  Widget cupertinoUi(AppTheme theme) => CupertinoTextField(
    controller: _controller,
    placeholder: widget.label,
    style: theme.typography.regular.copyWith(
      color: theme.colors.text.primary
    ),
    cursorColor: theme.colors.textField.primary,
    decoration: BoxDecoration(
      border: Border.all(color: theme.colors.textField.primary),
      borderRadius: BorderRadius.all(
        Radius.circular(theme.dimensions.radius.minimum)
      ),
    ),
    onChanged: widget.onChanged,
    suffix: AnimatedOpacity(
      opacity: _controller.text.isEmpty ? 0.0 : 1.0,
      duration: _cancelIconAnimDuration,
      child: Container(
        margin: EdgeInsets.only(right: theme.dimensions.padding.medium),
        child: cancelIcon(theme),
      ),
    ),
    padding: EdgeInsets.symmetric(
      vertical: theme.dimensions.padding.medium,
      horizontal: theme.dimensions.padding.medium,
    ),
  );

  Widget cancelIcon(AppTheme theme) => GestureDetector(
    onTap: () {
      setState(_controller.clear);
      widget.onCanceled?.call();
    },
    child: Image.asset(
      AppImages.loadPng('ic_cancel'),
      width: theme.dimensions.size.small,
      height: theme.dimensions.size.small,
      color: theme.colors.textField.primary,
    ),
  );
}