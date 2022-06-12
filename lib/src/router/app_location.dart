import 'package:flutter/material.dart';
import 'package:navigator2_practice/src/lib/router/app_location.dart';

class AppLocationHome extends AppLocation {
  @override
  String toPath() => '/';
}

class AppLocationSecond extends AppLocation {
  @override
  String toPath() => '/second';
}

class AppLocationThird extends AppLocation {
  AppLocationThird({required int activeIndex}) {
    pathSegments = ['third'];
    parameters = {'active_index': activeIndex.toString()};
  }

  @override
  String get signature => '/third/:active_index';

  @override
  String toPath() {
    return UriPathBuilder.build(signature, parameters: parameters);
  }
}
