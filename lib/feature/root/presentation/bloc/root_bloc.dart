import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc_factory.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_result.dart';
import 'package:poster/feature/root/presentation/bloc/root_event.dart';
import 'package:poster/navigation/app_route.dart';
import 'package:poster/navigation/app_router.dart';

final class RootBloc extends Bloc<RootEvent, void> {
  final AuthBlocFactory _authBlocFactory;
  final AppRouter _router;

  RootBloc({
    required AuthBlocFactory authBlocFactory,
    required AppRouter router,
  }) : _authBlocFactory = authBlocFactory,
    _router = router,
    super(null) {

    on<ShowAuth>(
      (event, emit) => _router.router.replaceNamed(
        AppRoute.auth.name,
        extra: _createAuthBloc(),
      ),
    );

    on<ShowMain>(
      (event, emit) {
        // TODO: rename + navigate to RootScreen
      }
    );

    add(ShowAuth());
  }

  AuthBloc _createAuthBloc() => _authBlocFactory.create(
    onBack: (result) => switch (result) {
      NavigateToMain() => add(ShowMain()),
    }
  );
}
