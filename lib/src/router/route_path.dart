class AppRoutePath {
  final String page;

  AppRoutePath.home() : page = '/';
  AppRoutePath.second() : page = '/second';
  AppRoutePath.third() : page = '/third';

  bool get isHome => page == '/';
  bool get isSecond => page == '/second';
  bool get isThird => page == '/third';
}
