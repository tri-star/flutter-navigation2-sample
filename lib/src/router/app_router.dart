import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/navigator/app_navigator.dart';
import 'package:navigator2_practice/src/pages/home_page.dart';
import 'package:navigator2_practice/src/pages/second_page.dart';
import 'package:navigator2_practice/src/pages/third_page.dart';
import 'package:navigator2_practice/src/router/route_path.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.path == '/second') {
      return AppRoutePath.second();
    }
    if (uri.path == '/third') {
      return AppRoutePath.third();
    }
    return AppRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath routePath) {
    if (routePath.isSecond) {
      return const RouteInformation(location: '/second');
    }
    if (routePath.isThird) {
      return const RouteInformation(location: '/third');
    }
    return const RouteInformation(location: '/');
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppNavigatorState navigatorState;

  AppRouterDelegate(this.navigatorState)
      : navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppRoutePath get currentConfiguration => navigatorState.currentRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _buildPages(navigatorState),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        navigatorState.setRoute(AppRoutePath.home());

        return true;
      },
    );
  }

  List<Page> _buildPages(AppNavigatorState state) {
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
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    navigatorState.setRoute(configuration);
    return SynchronousFuture<void>(null);
  }
}
