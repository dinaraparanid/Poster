enum AppRoute {
  root(path: '/root'),
  auth(path: '/auth'),
  signIn(path: '/auth/sign_in'),
  signUp(path: '/auth/sign_up'),
  main(path: '/main');

  final String path;
  const AppRoute({required this.path});
}
