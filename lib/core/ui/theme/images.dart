import 'package:flutter/cupertino.dart';

@immutable
class AppImages {
  const AppImages._();
  static String load(String file) => 'assets/images/$file';
}
