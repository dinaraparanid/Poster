import 'package:poster/feature/root/component/mod.dart';

extension Properties on RootState {
  bool get isSendEnabled => message?.isNotEmpty == true;
}