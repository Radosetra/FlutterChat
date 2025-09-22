import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_chat/config/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    // HomeScreen is generated as HomeRoute because
    // of the replaceInRouteName property
    // AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: ChatHomeRoute.page),
    AutoRoute(page: ChatDiscussionRoute.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}

final appRouterProvider = Provider((ref) => AppRouter());