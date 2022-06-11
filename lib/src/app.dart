import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:navigator2_practice/src/router/router_state.dart';
import 'package:navigator2_practice/src/router/app_router.dart';
import 'package:navigator2_practice/src/router/app_location.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RouterState _routerState = RouterState(AppLocation.home());
  late final AppRouterDelegate _routerDelegate;

  @override
  void initState() {
    super.initState();
    _routerDelegate = AppRouterDelegate(_routerState);
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
            routerDelegate: _routerDelegate,
            routeInformationParser: AppRouteInformationParser(),
          );
        }));
  }
}
