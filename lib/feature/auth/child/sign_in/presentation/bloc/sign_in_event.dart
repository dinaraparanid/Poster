sealed class SignInEvent {}

final class LoginChanged extends SignInEvent {
  final String login;
  LoginChanged({required this.login});
}

final class PasswordChanged extends SignInEvent {
  final String password;
  PasswordChanged({required this.password});
}

final class LoginCleared extends SignInEvent {}

final class PasswordVisibilityChanged extends SignInEvent {}

final class SignInClicked extends SignInEvent {}

final class SignUpClicked extends SignInEvent {}
