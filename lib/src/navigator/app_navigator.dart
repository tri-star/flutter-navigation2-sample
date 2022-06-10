import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/pages/home_page.dart';
import 'package:navigator2_practice/src/pages/second_page.dart';
import 'package:navigator2_practice/src/pages/third_page.dart';
import 'package:navigator2_practice/src/router/route_path.dart';

class AppNavigatorState with ChangeNotifier {
  AppRoutePath _currentRoute;

  AppNavigatorState(AppRoutePath currentRoute) : _currentRoute = currentRoute;

  AppRoutePath get currentRoute => _currentRoute;

  void setRoute(AppRoutePath route) {
    _currentRoute = route;
    notifyListeners();
  }
}

class AppNavigator {
  AppNavigator();

  Navigator build(AppNavigatorState state) {
    return Navigator(
      pages: _buildPages(state),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        state.setRoute(AppRoutePath.home());

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
}
