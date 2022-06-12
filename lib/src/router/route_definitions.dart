import 'package:flutter/material.dart';

typedef PageBuilder = Page Function();

/// ルート定義の1エントリ分を表すオブジェクト。
/// URIのシグネチャと、対応するページを構築するクロージャを持っている。
class RouteEntry {
  PageBuilder pageBuilder;

  RouteEntry({required this.pageBuilder});

  bool isRouteMatched() {
    return true;
  }
}

class RouteDefinition {
  final Map<String, RouteEntry> _routeEntries;

  RouteDefinition(Map<String, RouteEntry> entries) : _routeEntries = entries;

  Map<String, RouteEntry> get entries => _routeEntries;
}

// 最終的な利用イメージ
// var router = AppRouter({
//   '/': RouteEntry(
//     key: ValueKey(''),
//     pageBuilder: () => 
//   ),
// })

// MaterialApp(
//   routerDelegate: router.routerDelegate,
//   routeInformationParser: router.routeInformationParser,
// )