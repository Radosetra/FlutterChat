// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:my_chat/presentation/chat/pages/chat_discussion_screen.dart'
    as _i1;
import 'package:my_chat/presentation/chat/pages/chat_home_screen.dart' as _i2;
import 'package:my_chat/presentation/common/pages/home_screen.dart' as _i3;

/// generated route for
/// [_i1.ChatDiscussionScreen]
class ChatDiscussionRoute extends _i4.PageRouteInfo<void> {
  const ChatDiscussionRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ChatDiscussionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatDiscussionRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChatDiscussionScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatHomeScreen]
class ChatHomeRoute extends _i4.PageRouteInfo<void> {
  const ChatHomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ChatHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatHomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChatHomeScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}
