import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/pages/app_page.dart';
import 'package:navigator2_practice/src/router/app_location.dart';
import '../layoyuts/default_layout.dart';
import '../lib/router/router_state.dart';
import '../lib/router/app_location.dart';
import 'package:provider/provider.dart';

class HomePage extends AppPage {
  @override
  Widget buildPage(BuildContext context) {
    return DefaultLayout(
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('HomePage'),
      TextButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(4),
            backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
          ),
          onPressed: () {
            Provider.of<RouterState>(context, listen: false)
                .pushRoute(AppLocationSecond());
          },
          child: const Text('Second Page')),
      TextButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(4),
            backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
          ),
          onPressed: () {
            Provider.of<RouterState>(context, listen: false)
                .pushRoute(AppLocationThird(activeIndex: 0));
          },
          child: const Text('Third Page'))
    ]));
  }
}
