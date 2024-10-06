import 'package:poster/feature/auth/component/mod.dart';

extension Properties on AuthState {
  bool get isSignInEnabled => username.isNotEmpty;
}
