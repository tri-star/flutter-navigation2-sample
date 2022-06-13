import 'package:navigator2_practice/src/lib/router/base_route_definitions.dart';
import 'package:navigator2_practice/src/pages/home_page.dart';
import 'package:navigator2_practice/src/pages/second_page.dart';
import 'package:navigator2_practice/src/pages/third_page.dart';

class RouteDefinition extends BaseRouteDefinition {
  @override
  void initialize() {
    setDefinition({
      '/': RouteEntry(pageBuilder: () => HomePage()),
      '/second': RouteEntry(pageBuilder: () => SecondPage()),
      '/third/:active_index': RouteEntry(pageBuilder: () => ThirdPage()),
    });
  }
}
