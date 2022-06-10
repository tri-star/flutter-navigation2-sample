import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/layoyuts/default_layout.dart';
import 'package:navigator2_practice/src/navigator/app_navigator.dart';
import 'package:navigator2_practice/src/router/route_path.dart';
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
                          Navigator.pop(context);
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
                          Provider.of<AppNavigatorState>(context, listen: false)
                              .setRoute(AppRoutePath.third());
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
