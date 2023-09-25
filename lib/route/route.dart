import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/screen/1_basic_screen.dart';
import 'package:go_router_v7_actual/screen/3_push_screen.dart';
import 'package:go_router_v7_actual/screen/root_screen.dart';

// http://www.bullets.co.kr -> / -> path
// http://www.bullets.co.kr/ -> / -> path
// http://www.bullets.co.kr/flutter -> /flutter
// / -> home
// /basic -> basic screen
// /basic/basic_two ->
// /named
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return RootScreen();
      },
      routes: [
        // /basic
        GoRoute(
          path: 'basic',
          builder: (context, state) {
            return BasicScreen();
          },
        ),
        GoRoute(
          path: 'named',
          name: 'named_screen',
          builder: (context, state) {
            return BasicScreen();
          },
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) {
            return PushScreen();
          },
        ),
      ],
    ),
  ],
);
