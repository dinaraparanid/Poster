import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:poster/feature/auth/domain/use_case/login_use_case.dart';

final class SignInBlocFactory {
  final LoginUseCase _loginUseCase;

  SignInBlocFactory({
    required LoginUseCase loginUseCase
  }) : _loginUseCase = loginUseCase;

  SignInBloc create() => SignInBloc(loginUseCase: _loginUseCase);
}
