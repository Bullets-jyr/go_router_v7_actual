import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/screen/1_basic_screen.dart';
import 'package:go_router_v7_actual/screen/3_push_screen.dart';
import 'package:go_router_v7_actual/screen/4_pop_base_screen.dart';
import 'package:go_router_v7_actual/screen/5_pop_return_screen.dart';
import 'package:go_router_v7_actual/screen/6_path_param_screen.dart';
import 'package:go_router_v7_actual/screen/7_query_parameter.dart';
import 'package:go_router_v7_actual/screen/8_nested_child_screen.dart';
import 'package:go_router_v7_actual/screen/8_nested_screen.dart';
import 'package:go_router_v7_actual/screen/9_login_screen.dart';
import 'package:go_router_v7_actual/screen/9_private_screen.dart';
import 'package:go_router_v7_actual/screen/root_screen.dart';

// 로그인이 됐는지 안됐는지
// true - login OK / false - login NO
bool authState = false;

// http://www.bullets.co.kr -> / -> path
// http://www.bullets.co.kr/ -> / -> path
// http://www.bullets.co.kr/flutter -> /flutter
// / -> home
// /basic -> basic screen
// /basic/basic_two ->
// /named
final router = GoRouter(
  // state는 GoRouterState.of(context)와 동일합니다.
  // return String (path) -> 해당 라우트로 이동한다. (path)
  // return null -> 원래 이동하려던 라우트로 이동한다.
  // 모든 라우터에 적용이됩니다.
  redirect: (context, state) {
    if(state.location == '/login/private' && !authState) {
      return '/login';
    }

    return null;
  },
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
        GoRoute(
          path: 'pop',
          builder: (context, state) {
            // /pop
            return PopBaseScreen();
          },
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) {
                // /pop/return
                return PopReturnScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'path_param/:id', // /path_parma/123
          builder: (context, state) {
            return PathParamScreen();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return PathParamScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'query_param',
          builder: (context, state) {
            return QueryparameterScreen();
          },
        ),
        ShellRoute(
          builder: (context, state, child) {
            return NestedScreen(child: child);
          },
          routes: [
            // /nested/a
            GoRoute(
              path: 'nested/a',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/a',
              ),
            ),
            // /nested/b
            GoRoute(
              path: 'nested/b',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/b',
              ),
            ),
            // /nested/c
            GoRoute(
              path: 'nested/c',
              builder: (_, state) => NestedChildScreen(
                routeName: '/nested/c',
              ),
            ),
          ],
        ),
        // /login
        GoRoute(
          path: 'login',
          builder: (_, state) => LoginScreen(),
          routes: [
            // /login/private
            GoRoute(
              path: 'private',
              builder: (_, state) => PrivateScreen()
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (_, state) => LoginScreen(),
          routes: [
            // /login/private
            GoRoute(
              path: 'private',
              builder: (_, state) => PrivateScreen(),
              // 여기로 이동을 할 때만 적용이됩니다.
              redirect: (context, state) {
                if(!authState) {
                  return 'login2';
                }
                return null;
              }
            ),
          ],
        ),
      ],
    ),
  ],
);
