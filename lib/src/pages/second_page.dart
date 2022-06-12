import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/layoyuts/default_layout.dart';
import 'package:navigator2_practice/src/router/router_state.dart';
import 'package:navigator2_practice/src/router/app_location.dart';
import 'package:provider/provider.dart';

class SecondPage extends Page {
  const SecondPage() : super(key: const ValueKey('second'));

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
                    const Text('Second'),
                    TextButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(4),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber[100]),
                        ),
                        onPressed: () {
                          Provider.of<RouterState>(context, listen: false)
                              .popRoute();
                        },
                        child: const Text(
                          'Back',
                          style:
                              TextStyle(color: Color.fromARGB(255, 80, 62, 7)),
                        )),
                    TextButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(4),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber[100]),
                        ),
                        onPressed: () {
                          Provider.of<RouterState>(context, listen: false)
                              .pushRoute(AppLocationThird(activeIndex: 0));
                        },
                        child: const Text(
                          'Third',
                          style:
                              TextStyle(color: Color.fromARGB(255, 80, 62, 7)),
                        ))
                  ])));
        });
  }
}
