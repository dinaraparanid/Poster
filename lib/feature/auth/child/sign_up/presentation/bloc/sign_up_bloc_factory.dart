import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_result.dart';

final class SignUpBlocFactory {
  SignUpBloc create({required void Function(SignUpResult result) onBack}) =>
    SignUpBloc(onBack: onBack);
}
