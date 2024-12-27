import 'package:poster/feature/auth/child/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_result.dart';
import 'package:poster/feature/auth/domain/use_case/validate_email_use_case.dart';

final class SignUpBlocFactory {
  final SignUpUseCase _signUpUseCase;
  final ValidateEmailUseCase _validateEmailUseCase;

  SignUpBlocFactory({
    required SignUpUseCase signUpUseCase,
    required ValidateEmailUseCase validateEmailUseCase,
  }) : _signUpUseCase = signUpUseCase,
    _validateEmailUseCase = validateEmailUseCase;

  SignUpBloc create({required void Function(SignUpResult result) onBack}) =>
    SignUpBloc(
      signUpUseCase: _signUpUseCase,
      validateEmailUseCase: _validateEmailUseCase,
      onBack: onBack,
    );
}
