import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/main/presentation/bloc/main_event.dart';
import 'package:poster/feature/main/presentation/bloc/main_state.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState.initial());
}
