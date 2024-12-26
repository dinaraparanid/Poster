enum AppRoute {
  auth(path: '/auth'),
  signIn(path: '/auth/sign_in'),
  signUp(path: '/auth/sign_up');

  final String path;
  const AppRoute({required this.path});
}
