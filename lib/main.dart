import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:poster/app.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/di/app_module.dart';

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  di.registerAppModule();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final theme = AppTheme.create();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: theme.colors.background.primary,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  FlutterNativeSplash.remove();
  runApp(App(theme: theme));
}
