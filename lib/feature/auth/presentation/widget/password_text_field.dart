import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/app_text_field.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/core/utils/extension/bool_ext.dart';

final class PasswordTextField extends StatefulWidget {
  final bool isPasswordVisible;
  final void Function(String) onChanged;
  final void Function() onPasswordVisibilityChanged;

  const PasswordTextField({
    super.key,
    required this.isPasswordVisible,
    required this.onChanged,
    required this.onPasswordVisibilityChanged,
  });

  @override
  State<StatefulWidget> createState() => _PasswordTextFieldState();
}

final class _PasswordTextFieldState extends State<PasswordTextField> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.dimensions.padding.medium,
      ),
      constraints: BoxConstraints(
        maxWidth: theme.dimensions.size.extraEnormous,
      ),
      child: AppTextField(
        controller: controller,
        label: strings.auth_password,
        icon: AppImages.loadSvg(
          widget.isPasswordVisible ? 'ic_eye' : 'ic_eye_closed',
        ),
        obscureText: widget.isPasswordVisible.not,
        onChanged: widget.onChanged,
        onIconClicked: widget.onPasswordVisibilityChanged,
      ),
    );
  }
}
