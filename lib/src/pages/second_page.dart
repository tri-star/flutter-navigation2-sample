import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/lib/router/router_state.dart';
import 'package:navigator2_practice/src/pages/app_page.dart';
import '../layoyuts/default_layout.dart';
import '../router/app_location.dart';
import 'package:provider/provider.dart';

class SecondPage extends AppPage {
  @override
  Widget buildPage(BuildContext context) {
    return DefaultLayout(
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Second'),
      TextButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(4),
            backgroundColor: MaterialStateProperty.all(Colors.amber[100]),
          ),
          onPressed: () {
            Provider.of<RouterState>(context, listen: false).popRoute();
          },
          child: const Text(
            'Back',
            style: TextStyle(color: Color.fromARGB(255, 80, 62, 7)),
          )),
      TextButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(4),
            backgroundColor: MaterialStateProperty.all(Colors.amber[100]),
          ),
          onPressed: () {
            Provider.of<RouterState>(context, listen: false)
                .pushRoute(AppLocationThird(activeIndex: 0));
          },
          child: const Text(
            'Third',
            style: TextStyle(color: Color.fromARGB(255, 80, 62, 7)),
          ))
    ]));
  }
}
