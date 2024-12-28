sealed class SignInEvent {}

final class EmailChange extends SignInEvent {
  final String email;
  EmailChange({required this.email});
}

final class PasswordChange extends SignInEvent {
  final String password;
  PasswordChange({required this.password});
}

final class EmailClear extends SignInEvent {}

final class PasswordVisibilityChange extends SignInEvent {}

final class SignInClick extends SignInEvent {}

final class SignUpClick extends SignInEvent {}

final class ShowRoot extends SignInEvent {}

final class ClearError extends SignInEvent {}
