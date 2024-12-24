import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_state.dart';

final class AuthBloc extends Bloc<void, AuthState> {
  AuthBloc() : super(const AuthState());
}
