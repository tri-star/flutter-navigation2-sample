import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/lib/router/router_state.dart';
import 'package:navigator2_practice/src/pages/app_page.dart';
import '../layoyuts/default_layout.dart';
import '../router/app_location.dart';
import 'package:provider/provider.dart';

class ThirdPage extends AppPage {
  @override
  Widget buildPage(BuildContext context) {
    return _ThirdPage();
  }
}

class _ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<_ThirdPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RouterState>(builder: (context, routerState, child) {
      _tabController.animateTo(int.parse(
          routerState.currentRoute.parameters['active_index'] ?? '0'));
      return DefaultLayout(
          TabBarView(controller: _tabController, children: [
            _buildTabA(context),
            const Text('Tab B'),
            const Text('Tab C'),
          ]),
          tabBar: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'A'),
                Tab(text: 'B'),
                Tab(text: 'C'),
              ],
              onTap: (int index) {
                routerState.pushRoute(AppLocationThird(activeIndex: index));
              }));
    });
  }

  Widget _buildTabA(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Third'),
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
          ))
    ]);
  }
}
