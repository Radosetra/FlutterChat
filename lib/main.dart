import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/config/app_router.dart';
import 'package:my_chat/config/app_router.gr.dart';
import 'package:my_chat/presentation/common/providers/auth_provider.dart';

void main() {
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Correctly get the router instance
    final appRouter = ref.watch(appRouterProvider); // if appRouterProvider changed - the widget is rebuild

    // Correctly listen to the auth state for navigation
    ref.listen(authProvider, (previousState, newState) {
      if (newState.status == AuthStatus.authenticated) {
        // Redirect to the main authenticated screen
        appRouter.replaceAll([const ChatHomeRoute()]);
      } else if (newState.status == AuthStatus.unauthenticated) {
        // Redirect to the login screen
        appRouter.replaceAll([const LoginRoute()]);
      }
    });

    // AutoRoute handle routes
    return MaterialApp.router(
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
