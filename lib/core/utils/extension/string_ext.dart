import 'package:poster/core/utils/extension/bool_ext.dart';

extension StringExt on String {
  bool get isBlank => trim().isEmpty;
  bool get isNotBlank => isBlank.not;
}
