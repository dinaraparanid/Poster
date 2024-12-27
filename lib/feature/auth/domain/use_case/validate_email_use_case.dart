final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

final class ValidateEmailUseCase {
  bool execute(String email) => _emailRegex.hasMatch(email);
}
