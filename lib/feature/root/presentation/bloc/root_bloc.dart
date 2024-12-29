import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc_factory.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_result.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc_factory.dart';
import 'package:poster/feature/root/domain/use_case/check_signed_in_use_case.dart';
import 'package:poster/feature/root/presentation/bloc/root_event.dart';
import 'package:poster/navigation/app_route.dart';
import 'package:poster/navigation/app_router.dart';

final class RootBloc extends Bloc<RootEvent, void> {
  final AuthBlocFactory _authBlocFactory;
  final MainBlocFactory _mainBlocFactory;
  final AppRouter _router;

  RootBloc({
    required AuthBlocFactory authBlocFactory,
    required MainBlocFactory mainBlocFactory,
    required CheckSignedInUseCase checkSignedInUseCase,
    required AppRouter router,
  }) : _authBlocFactory = authBlocFactory,
    _mainBlocFactory = mainBlocFactory,
    _router = router,
    super(null) {

    on<ShowAuth>(
      (event, emit) => _router.router.replaceNamed(
        AppRoute.auth.name,
        extra: _createAuthBloc(),
      ),
    );

    on<ShowMain>(
      (event, emit) => _router.router.replaceNamed(
        AppRoute.main.name,
        extra: _createMainBloc(),
      )
    );

    checkSignedInUseCase.signedInChanges.listen(
      (isSignedIn) => add(isSignedIn ? ShowMain() : ShowAuth()),
    );
  }

  AuthBloc _createAuthBloc() => _authBlocFactory.create(
    onBack: (result) => switch (result) {
      NavigateToMain() => add(ShowMain()),
    }
  );

  MainBloc _createMainBloc() => _mainBlocFactory.create();
}
