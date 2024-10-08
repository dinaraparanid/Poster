import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/wall/component/mod.dart';
import 'package:poster/feature/wall/presentation/ui/profile/container.dart';

final class WallScreen extends StatelessWidget {
  const WallScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => WallComponent(repository: context.read()),
    child: const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileContainer(),
        ],
      ),
    ),
  );
}
