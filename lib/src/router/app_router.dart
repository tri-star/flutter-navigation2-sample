import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/router/router_state.dart';
import 'package:navigator2_practice/src/pages/home_page.dart';
import 'package:navigator2_practice/src/pages/second_page.dart';
import 'package:navigator2_practice/src/pages/third_page.dart';
import 'package:navigator2_practice/src/router/app_location.dart';

class AppRouterDelegate extends RouterDelegate<AppLocation>
    with ChangeNotifier {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final RouterState routerState;

  AppRouterDelegate(this.routerState)
      : navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppLocation get currentConfiguration => routerState.currentRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _buildPages(routerState),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (!routerState.canPop()) {
          return false;
        }
        routerState.popRoute();

        return true;
      },
    );
  }

  List<Page> _buildPages(RouterState state) {
    List<Page> pages = [
      const HomePage(),
    ];

    if (state.currentRoute.isSecond) {
      pages.add(const SecondPage());
    }
    if (state.currentRoute.isThird) {
      pages.add(const ThirdPage());
    }

    return pages;
  }

  @override
  Future<void> setNewRoutePath(AppLocation configuration) async {
    routerState.setRoute(configuration);
    return SynchronousFuture<void>(null);
  }

  @override
  Future<bool> popRoute() {
    if (!routerState.canPop()) {
      return SynchronousFuture<bool>(false);
    }
    routerState.popRoute();
    return SynchronousFuture<bool>(true);
  }
}
