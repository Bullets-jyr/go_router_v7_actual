import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/layout/default_layout.dart';

class QueryparameterScreen extends StatelessWidget {
  const QueryparameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Text('Query Parameter : ${GoRouterState.of(context).queryParameters}'),
          // /query_parameter?name=bullets&age=33
          ElevatedButton(
            onPressed: () {
              context.push(
                Uri(
                  path: '/query_param',
                  // 모두 String이어야 합니다.
                  queryParameters: {
                    'name': 'bullets',
                    'age': '33',
                  },
                ).toString(),
              );
            },
            child: Text('Query Parameter'),
          ),
        ],
      ),
    );
  }
}
