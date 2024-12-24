import 'package:flutter/cupertino.dart';

extension IconTint on Color {
  ColorFilter get iconTint => ColorFilter.mode(this, BlendMode.srcIn);
}
