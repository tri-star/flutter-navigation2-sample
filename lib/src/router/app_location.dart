import 'package:flutter/material.dart';

class AppLocation {
  final String page;

  AppLocation.home() : page = '/';
  AppLocation.second() : page = '/second';
  AppLocation.third() : page = '/third';

  bool get isHome => page == '/';
  bool get isSecond => page == '/second';
  bool get isThird => page == '/third';
}

class AppRouteInformationParser extends RouteInformationParser<AppLocation> {
  @override
  Future<AppLocation> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.path == '/second') {
      return AppLocation.second();
    }
    if (uri.path == '/third') {
      return AppLocation.third();
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
