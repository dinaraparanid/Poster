import 'package:poster/feature/auth/presentation/bloc/auth_bloc_factory.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc_factory.dart';
import 'package:poster/feature/root/domain/use_case/check_signed_in_use_case.dart';
import 'package:poster/feature/root/presentation/bloc/root_bloc.dart';
import 'package:poster/navigation/app_router.dart';

final class RootBlocFactory {
  final AuthBlocFactory _authBlocFactory;
  final MainBlocFactory _mainBlocFactory;
  final CheckSignedInUseCase _checkSignedInUseCase;
  final AppRouter _router;

  RootBlocFactory({
    required AuthBlocFactory authBlocFactory,
    required MainBlocFactory mainBlocFactory,
    required CheckSignedInUseCase checkSignedInUseCase,
    required AppRouter router,
  }) : _authBlocFactory = authBlocFactory,
    _mainBlocFactory = mainBlocFactory,
    _checkSignedInUseCase = checkSignedInUseCase,
    _router = router;

  RootBloc create() => RootBloc(
    authBlocFactory: _authBlocFactory,
    mainBlocFactory: _mainBlocFactory,
    checkSignedInUseCase: _checkSignedInUseCase,
    router: _router,
  );
}
