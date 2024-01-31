part of 'intro_bloc.dart';

@immutable
class IntroState {
  final int? pageIndex;
  final int? pageLength;
  const IntroState({this.pageIndex, this.pageLength = 0});
}

class InitialIntroState extends IntroState {
  const InitialIntroState() : super(pageIndex: 0);
}

class IntermediateIntroState extends IntroState {
  final int newPageIndex;
  const IntermediateIntroState({required this.newPageIndex})
      : super(pageIndex: newPageIndex);
}

class FinalIntroState extends IntroState {
  final int newPageIndex;
  const FinalIntroState({required this.newPageIndex})
      : super(pageIndex: newPageIndex);
}
