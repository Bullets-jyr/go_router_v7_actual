import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/screen/root_screen.dart';

// http://www.bullets.co.kr -> / -> path
// http://www.bullets.co.kr/ -> / -> path
// http://www.bullets.co.kr/flutter -> /flutter
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return RootScreen();
      },
    ),
  ],
);
