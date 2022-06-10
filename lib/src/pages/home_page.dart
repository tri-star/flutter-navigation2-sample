import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/layoyuts/default_layout.dart';
import 'package:navigator2_practice/src/navigator/app_navigator.dart';
import 'package:navigator2_practice/src/router/route_path.dart';
import 'package:provider/provider.dart';

class HomePage extends Page {
  const HomePage() : super(key: const ValueKey('home'));

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        pageBuilder: (context, animation, animation2) {
          final curveTween = CurveTween(curve: Curves.easeOut);
          return DefaultLayout(FadeTransition(
              opacity: animation.drive(curveTween),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HomePage'),
                    TextButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(4),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[200]),
                        ),
                        onPressed: () {
                          Provider.of<AppNavigatorState>(context, listen: false)
                              .setRoute(AppRoutePath.second());
                        },
                        child: const Text('Second Page')),
                    TextButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(4),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[200]),
                        ),
                        onPressed: () {
                          Provider.of<AppNavigatorState>(context, listen: false)
                              .setRoute(AppRoutePath.third());
                        },
                        child: const Text('Third Page'))
                  ])));
        });
  }
}
