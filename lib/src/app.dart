import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:navigator2_practice/src/router/route_definition.dart';
import 'lib/router/router_state.dart';
import 'lib/router/app_router.dart';
import 'router/app_location.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RouterState _routerState = RouterState(AppLocationHome());
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();

    var routeDefinition = RouteDefinition();
    routeDefinition.initialize();

    _router =
        AppRouter(routeDefinition: routeDefinition, routerState: _routerState);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<RouterState>.value(value: _routerState)
        ],
        child: Consumer<RouterState>(builder: (context, state, _) {
          return MaterialApp.router(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.light,
            routerDelegate: _router.routerDelegate,
            routeInformationParser: _router.routeInformationParser,
          );
        }));
  }
}
