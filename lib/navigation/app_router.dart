import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poster/navigation/app_route.dart';
import 'package:poster/navigation/screens.dart';

final class AppRouter {
  late final router = GoRouter(
    initialLocation: AppRoute.auth.path,
    routes: [
      GoRoute(
        path: AppRoute.auth.path,
        name: AppRoute.auth.name,
        builder: (context, state) => AuthScreen(bloc: context.read<AuthBloc>()),
      ),
      GoRoute(
        path: AppRoute.signIn.path,
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: SignInScreen(bloc: state.extra as SignInBloc),
          transitionsBuilder: (_, animation, __, child) =>
            _screenFadeTransition(animation: animation, child: child),
        ),
      ),
      GoRoute(
        path: AppRoute.signUp.path,
        name: AppRoute.signUp.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: SignUpScreen(bloc: state.extra as SignUpBloc),
          transitionsBuilder: (_, animation, __, child) =>
            _screenFadeTransition(animation: animation, child: child),
        ),
      ),
    ],
  );

  FadeTransition _screenFadeTransition({
    required Animation<double> animation,
    required Widget child,
  }) => FadeTransition(
    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
    child: child,
  );
}
