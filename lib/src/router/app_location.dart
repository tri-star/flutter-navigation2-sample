import 'package:flutter/material.dart';

class AppLocation {
  final String page;
  final int activeTab;

  AppLocation.home()
      : page = '/',
        activeTab = 0;
  AppLocation.second()
      : page = '/second',
        activeTab = 0;
  AppLocation.third({this.activeTab = 0}) : page = '/third/{$activeTab}';

  bool get isHome => page == '/';
  bool get isSecond => page == '/second';
  bool get isThird => page.startsWith('/third');
}

class AppRouteInformationParser extends RouteInformationParser<AppLocation> {
  @override
  Future<AppLocation> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.path == '/second') {
      return AppLocation.second();
    }
    var regExp = RegExp(r'/third/(?<index>:[0-9]?)');
    var matched = regExp.firstMatch(uri.path);
    if (matched != null) {
      var index = matched.namedGroup('index');
      return AppLocation.third(
          activeTab: int.parse(matched.namedGroup('index') ?? '0'));
    }
    return AppLocation.home();
  }

  @override
  RouteInformation restoreRouteInformation(AppLocation routePath) {
    if (routePath.isSecond) {
      return const RouteInformation(location: '/second');
    }
    if (routePath.isThird) {
      return const RouteInformation(location: '/third');
    }
    return const RouteInformation(location: '/');
  }
}
