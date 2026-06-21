import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/di/injection.dart' as di;
import 'core/logging/state_logger.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up structured logging of state changes.
  Bloc.observer = StateLogger();

  // Initialize dependency injection.
  di.initDependencies();

  runApp(const ZiroFitApp());
}

class ZiroFitApp extends StatefulWidget {
  const ZiroFitApp({super.key});

  @override
  State<ZiroFitApp> createState() => _ZiroFitAppState();
}

class _ZiroFitAppState extends State<ZiroFitApp> {
  late final AuthCubit _authCubit;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authCubit = di.getIt<AuthCubit>();
    _router = createAppRouter(_authCubit);
    // Check auth status on first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authCubit.checkAuthStatus();
    });
  }

  @override
  void dispose() {
    _authCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authCubit,
      child: MaterialApp.router(
        title: 'ZIRO.FIT',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
