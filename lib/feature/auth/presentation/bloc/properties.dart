import 'package:poster/feature/auth/presentation/bloc/auth_state.dart';

extension Properties on AuthState {
  bool get isSignInEnabled => username.isNotEmpty;
}
