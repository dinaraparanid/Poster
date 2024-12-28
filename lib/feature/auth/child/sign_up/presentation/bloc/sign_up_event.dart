sealed class SignUpEvent {}

final class EmailChange extends SignUpEvent {
  final String email;
  EmailChange({required this.email});
}

final class UsernameChange extends SignUpEvent {
  final String username;
  UsernameChange({required this.username});
}

final class PasswordChange extends SignUpEvent {
  final String password;
  PasswordChange({required this.password});
}

final class EmailClear extends SignUpEvent {}

final class UsernameClear extends SignUpEvent {}

final class PasswordVisibilityChange extends SignUpEvent {}

final class SignUpClick extends SignUpEvent {}

final class BackClick extends SignUpEvent {}

final class ClearError extends SignUpEvent {}
