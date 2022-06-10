import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/layoyuts/default_layout.dart';

class ThirdPage extends Page {
  const ThirdPage() : super(key: const ValueKey('third'));

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
                    const Text('Third'),
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
                        ))
                  ])));
        });
  }
}
