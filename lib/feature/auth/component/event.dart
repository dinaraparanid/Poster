sealed class AuthEvent {}

final class UsernameChanged extends AuthEvent {
  final String username;
  UsernameChanged({required this.username});
}

final class SignInClicked extends AuthEvent {}
