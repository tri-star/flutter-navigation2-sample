import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:navigator2_practice/src/navigator/app_navigator.dart';
import 'package:navigator2_practice/src/router/app_router.dart';
import 'package:navigator2_practice/src/router/route_path.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppNavigatorState _navigatorState =
      AppNavigatorState(AppRoutePath.home());
  late final AppRouterDelegate _routerDelegate;

  @override
  void initState() {
    super.initState();
    _routerDelegate = AppRouterDelegate(_navigatorState);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppNavigatorState>.value(
              value: _navigatorState)
        ],
        child: Consumer<AppNavigatorState>(builder: (context, state, _) {
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
