import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/app_text_field.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';

final class ClearableTextField extends StatefulWidget {
  final String label;
  final void Function(String) onChanged;
  final void Function() onClear;

  const ClearableTextField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.onClear,
  });

  @override
  State<StatefulWidget> createState() => _ClearableTextFieldState();
}

final class _ClearableTextFieldState extends State<ClearableTextField> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.dimensions.padding.medium,
      ),
      constraints: BoxConstraints(
        maxWidth: theme.dimensions.size.extraEnormous,
      ),
      child: AppTextField(
        controller: controller,
        label: widget.label,
        icon: AppImages.loadSvg('ic_cancel'),
        onChanged: widget.onChanged,
        onIconClicked: () {
          widget.onClear();
          controller.clear();
        },
      ),
    );
  }
}
