part of 'intro_bloc.dart';

@immutable
class IntroEvent {}

class PageLoadEvent extends IntroEvent{
  final int pageLength;

  PageLoadEvent({required this.pageLength});
}

class PageChangedEvent extends IntroEvent{
  final int index;
  PageChangedEvent({required this.index});
}