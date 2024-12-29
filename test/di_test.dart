import 'package:dio/dio.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/auth/child/sign_in/domain/use_case/sign_in_use_case.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc_factory.dart';
import 'package:poster/feature/auth/child/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_bloc_factory.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';
import 'package:poster/feature/auth/domain/use_case/validate_email_use_case.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc_factory.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc_factory.dart';
import 'package:poster/feature/root/domain/use_case/check_signed_in_use_case.dart';
import 'package:poster/feature/root/presentation/bloc/root_bloc_factory.dart';
import 'package:poster/navigation/app_router.dart';
import 'package:test/test.dart';

void main() {
  test('Check dependency graph', () {
    di.registerAppModule();

    expect(canRetrieve<Dio>(), true);
    expect(canRetrieve<AppRouter>(), true);

    expect(canRetrieve<CheckSignedInUseCase>(), true);
    expect(canRetrieve<RootBlocFactory>(), true);

    expect(canRetrieve<SignInUseCase>(), true);
    expect(canRetrieve<SignInBlocFactory>(), true);

    expect(canRetrieve<SignUpUseCase>(), true);
    expect(canRetrieve<SignUpBlocFactory>(), true);

    expect(canRetrieve<ValidateEmailUseCase>(), true);
    expect(canRetrieve<AuthRepository>(), true);
    expect(canRetrieve<AuthBlocFactory>(), true);

    expect(canRetrieve<MainBlocFactory>(), true);
  });
}

bool canRetrieve<T extends Object>() {
  try {
    di<T>();
    return true;
  } catch (_) {
    return false;
  }
}
