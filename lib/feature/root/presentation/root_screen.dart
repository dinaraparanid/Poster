import 'package:flutter/cupertino.dart';
import 'package:poster/feature/root/presentation/bloc/root_bloc.dart';

final class RootScreen extends StatelessWidget {
  final RootBloc bloc;
  const RootScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) => const SizedBox.expand();
}
