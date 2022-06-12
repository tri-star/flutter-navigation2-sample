import 'package:flutter/material.dart';
import '../layoyuts/default_layout.dart';
import '../router/router_state.dart';
import '../router/app_location.dart';
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
                          Provider.of<RouterState>(context, listen: false)
                              .pushRoute(AppLocationSecond());
                        },
                        child: const Text('Second Page')),
                    TextButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(4),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue[200]),
                        ),
                        onPressed: () {
                          Provider.of<RouterState>(context, listen: false)
                              .pushRoute(AppLocationThird(activeIndex: 0));
                        },
                        child: const Text('Third Page'))
                  ])));
        });
  }
}
