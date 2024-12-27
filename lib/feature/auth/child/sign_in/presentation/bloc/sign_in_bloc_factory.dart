import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_result.dart';
import 'package:poster/feature/auth/child/sign_in/domain/use_case/sign_in_use_case.dart';
import 'package:poster/feature/auth/domain/use_case/validate_email_use_case.dart';

final class SignInBlocFactory {
  final SignInUseCase _loginUseCase;
  final ValidateEmailUseCase _validateEmailUseCase;

  SignInBlocFactory({
    required SignInUseCase loginUseCase,
    required ValidateEmailUseCase validateEmailUseCase,
  }) : _loginUseCase = loginUseCase,
    _validateEmailUseCase = validateEmailUseCase;

  SignInBloc create({required void Function(SignInResult) onBack}) =>
    SignInBloc(
      loginUseCase: _loginUseCase,
      validateEmailUseCase: _validateEmailUseCase,
      onBack: onBack
    );
}
