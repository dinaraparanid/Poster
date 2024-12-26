sealed class SignInEvent {}

final class LoginChange extends SignInEvent {
  final String login;
  LoginChange({required this.login});
}

final class PasswordChange extends SignInEvent {
  final String password;
  PasswordChange({required this.password});
}

final class LoginClear extends SignInEvent {}

final class PasswordVisibilityChange extends SignInEvent {}

final class SignInClick extends SignInEvent {}

final class SignUpClick extends SignInEvent {}
