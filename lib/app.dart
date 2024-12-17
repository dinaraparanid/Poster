import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/data/profile/data_source/profile_local_data_source_impl.dart';
import 'package:poster/core/data/profile/repository/profile_repository_impl.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/core/presentation/theme/mod.dart';
import 'package:poster/data/dio/dio.dart';
import 'package:poster/data/post/mod.dart';
import 'package:poster/domain/auth/mod.dart';
import 'package:poster/domain/post/mod.dart';
import 'package:poster/feature/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:poster/feature/auth/data/repository/repository.dart';
import 'package:poster/feature/auth/presentation/auth_screen.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.create();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => theme),
        RepositoryProvider(create: (_) => AppDio()),

        // TODO: GetIt

        // ---------------------- Profile ----------------------
        RepositoryProvider<ProfileLocalDataSource>(create: (context) => ProfileLocalDataSourceImpl()),
        RepositoryProvider<ProfileRepository>(
          create: (context) => ProfileRepositoryImpl(
            storage: context.read()
          )
        ),

        // ---------------------- Auth ----------------------
        RepositoryProvider<AuthRemoteDataSource>(create: (context) => AuthRemoteDataSourceImpl(client: context.read())),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            profileRepository: context.read(),
            api: context.read(),
          ),
        ),

        // ---------------------- Posts ----------------------
        RepositoryProvider<LikeApi>(create: (context) => LikeApiImpl(client: context.read())),
        RepositoryProvider<PostApi>(create: (context) => PostApiImpl(client: context.read())),
        RepositoryProvider<PostRepository>(
          create: (context) => PostRepositoryImpl(
            postApi: context.read(),
            likeApi: context.read(),
          )
        ),
      ],
      child: MaterialApp(
        color: theme.colors.background.primary,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: theme.colors.textField.primary.withValues(alpha: 0.5),
            selectionHandleColor: theme.colors.textField.primary,
            cursorColor: theme.colors.textField.primary,
          ),
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
