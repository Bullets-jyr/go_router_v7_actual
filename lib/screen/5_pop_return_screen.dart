import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_v7_actual/layout/default_layout.dart';

class PopReturnScreen extends StatelessWidget {
  const PopReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              // 딱 하나의 값만 반환할 수 있다. ex) String, List, Class
              context.pop('Bullets');
            },
            child: Text('Pop'),
          ),
        ],
      ),
    );
  }
}
