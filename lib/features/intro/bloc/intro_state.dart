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

class IntermediateIntroState extends IntroState{
  @override
  final int pageIndex;
  const IntermediateIntroState({required this.pageIndex}) : super(pageIndex: pageIndex);
}

class FinalIntroState extends IntroState{
  final int pageIndex;
  const FinalIntroState({required this.pageIndex}):super(pageIndex: pageIndex);
}
