import 'package:flutter/material.dart';
import '../router/router_state.dart';
import '../router/app_location.dart';
import 'package:provider/provider.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? tabBar;

  const DefaultLayout(this.child, {this.tabBar, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator 2.0 sample"),
        bottom: tabBar,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Provider.of<RouterState>(context, listen: false)
                    .pushRoute(AppLocationHome());
              },
            ),
            ListTile(
              title: const Text("Second"),
              onTap: () {
                Provider.of<RouterState>(context, listen: false)
                    .pushRoute(AppLocationSecond());
              },
            ),
            ListTile(
              title: const Text("Third"),
              onTap: () {
                Provider.of<RouterState>(context, listen: false)
                    .pushRoute(AppLocationThird(activeIndex: 0));
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
