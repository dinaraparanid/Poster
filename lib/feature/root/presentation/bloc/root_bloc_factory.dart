import 'package:poster/feature/auth/presentation/bloc/auth_bloc_factory.dart';
import 'package:poster/feature/root/presentation/bloc/root_bloc.dart';
import 'package:poster/navigation/app_router.dart';

final class RootBlocFactory {
  final AuthBlocFactory _authBlocFactory;
  final AppRouter _router;

  RootBlocFactory({
    required AuthBlocFactory authBlocFactory,
    required AppRouter router,
  }) : _authBlocFactory = authBlocFactory, _router = router;

  RootBloc create() => RootBloc(
    authBlocFactory: _authBlocFactory,
    router: _router,
  );
}
