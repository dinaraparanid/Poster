import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poster/core/presentation/foundation/image_asset.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/utils/icon_tint.dart';
import 'package:poster/core/utils/functions/let.dart';

const _cancelIconAnimDuration = Duration(milliseconds: 100);
const _passwordObscuringCharacter = '*';

final class AppTextField extends StatefulWidget {
  final String label;
  final ImageAsset icon;
  final bool obscureText;
  final String? error;
  final TextEditingController controller;

  final void Function(String) onChanged;
  final void Function()? onIconClicked;

  const AppTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.onChanged,
    required this.controller,
    this.obscureText = false,
    this.onIconClicked,
    this.error,
  });

  @override
  State<StatefulWidget> createState() => _AppTextField();
}

final class _AppTextField extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    return PlatformUi(cupertino: CupertinoUi, material: MaterialUi)(theme);
  }

  Widget MaterialUi(AppTheme theme) => TextField(
    controller: widget.controller,
    onChanged: widget.onChanged,
    style: theme.typography.body.copyWith(
      color: theme.colors.text.primary
    ),
    obscureText: widget.obscureText,
    obscuringCharacter: _passwordObscuringCharacter,
    cursorColor: theme.colors.textField.primary,
    decoration: InputDecoration(
      errorText: widget.error,
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
        opacity: widget.controller.text.isEmpty ? 0.0 : 1.0,
        duration: _cancelIconAnimDuration,
        child: Container(
          margin: EdgeInsets.only(right: theme.dimensions.padding.medium),
          child: CancelIcon(theme),
        ),
      ),
      suffixIconConstraints: BoxConstraints.expand(
        width: theme.dimensions.size.medium,
        height: theme.dimensions.size.small,
      )
    ),
  );

  Widget CupertinoUi(AppTheme theme) => CupertinoFormRow(
    padding: EdgeInsets.zero,
    error: widget.error?.let((e) => Text(e)),
    child: CupertinoTextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      placeholder: widget.label,
      style: theme.typography.regular.copyWith(
          color: theme.colors.text.primary
      ),
      obscureText: widget.obscureText,
      obscuringCharacter: _passwordObscuringCharacter,
      cursorColor: theme.colors.textField.primary,
      decoration: BoxDecoration(
        border: Border.all(color: theme.colors.textField.primary),
        borderRadius: BorderRadius.all(
            Radius.circular(theme.dimensions.radius.minimum)
        ),
      ),
      suffix: AnimatedOpacity(
        opacity: widget.controller.text.isEmpty ? 0.0 : 1.0,
        duration: _cancelIconAnimDuration,
        child: Container(
          margin: EdgeInsets.only(right: theme.dimensions.padding.medium),
          child: CancelIcon(theme),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: theme.dimensions.padding.medium,
        horizontal: theme.dimensions.padding.medium,
      ),
    ),
  );

  Widget CancelIcon(AppTheme theme) => GestureDetector(
    onTap: () => setState(() => widget.onIconClicked?.call()),
    child: SvgPicture.asset(
      widget.icon.value,
      width: theme.dimensions.size.small,
      height: theme.dimensions.size.small,
      colorFilter: theme.colors.textField.primary.iconTint,
    ),
  );
}