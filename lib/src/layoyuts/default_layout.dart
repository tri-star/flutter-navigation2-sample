import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/router/router_state.dart';
import 'package:navigator2_practice/src/router/app_location.dart';
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Provider.of<RouterState>(context, listen: false)
                    .pushRoute(AppLocation.home());
              },
            ),
            ListTile(
              title: const Text("Second"),
              onTap: () {
                Provider.of<RouterState>(context, listen: false)
                    .pushRoute(AppLocation.second());
              },
            ),
            ListTile(
              title: const Text("Third"),
              onTap: () {
                Provider.of<RouterState>(context, listen: false)
                    .pushRoute(AppLocation.third());
              },
            ),
          ],
        ),
      ),
      body: Consumer<RouterState>(
        builder: (context, routerState, _) {
          return child;
        },
      ),
    );
  }
}
