import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './route_definitions.dart';
import './router_state.dart';
import '../pages/home_page.dart';
import '../router/app_location.dart';

class AppRouteInformationParser extends RouteInformationParser<AppLocation> {
  RouteDefinition definition;

  AppRouteInformationParser(this.definition);

  @override
  Future<AppLocation> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    for (final pathSignature in definition.entries.keys) {
      var result = UriPathParser.parse(pathSignature, uri);
      if (!result.success) {
        continue;
      }
      return SynchronousFuture(AppLocation.fromPathParseResult(result));
    }

    return AppLocation.fromPathString('/');
  }

  @override
  RouteInformation restoreRouteInformation(AppLocation location) {
    return location.toRouteInformation();
  }
}

class AppRouterDelegate extends RouterDelegate<AppLocation>
    with ChangeNotifier {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final RouteDefinition routeDefinition;
  final RouterState routerState;

  AppRouterDelegate({required this.routeDefinition, required this.routerState})
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

    for (final pathSignature in routeDefinition.entries.keys) {
      var result = UriPathParser.parse(
          pathSignature, Uri.parse(state.currentRoute.toPath()));
      if (!result.success) {
        continue;
      }
      pages.add(routeDefinition.entries[pathSignature]!.pageBuilder());
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

class AppRouter {
  final RouteDefinition routeDefinition;
  final AppRouterDelegate routerDelegate;
  final AppRouteInformationParser routeInformationParser;

  AppRouter(this.routeDefinition, RouterState routerState)
      : routerDelegate = AppRouterDelegate(
            routeDefinition: routeDefinition, routerState: routerState),
        routeInformationParser = AppRouteInformationParser(routeDefinition);
}
