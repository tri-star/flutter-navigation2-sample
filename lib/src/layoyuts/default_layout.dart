import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/navigator/app_navigator.dart';
import 'package:provider/provider.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;

  const DefaultLayout(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator 2.0 sample"),
      ),
      body: Consumer<AppNavigatorState>(
        builder: (context, naviGatorState, _) {
          return child;
        },
      ),
    );
  }
}
