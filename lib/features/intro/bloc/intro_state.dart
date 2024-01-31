part of 'intro_bloc.dart';

enum ScreenType {
  initialPage,
  intermediatePage,
  finalPage,
}

@immutable
class IntroState {
  final int? pageIndex;
  final int? pageLength;
  final ScreenType? screenType;

  const IntroState({this.pageIndex, this.pageLength = 0,this.screenType});
}
