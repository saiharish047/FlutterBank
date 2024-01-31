import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

//bloc will contain all business logic, API calls

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  late int pageLength;
  IntroBloc() : super(const IntroState(pageIndex: 0,screenType: ScreenType.initialPage)) {

    on<PageLoadEvent>((event, emit) {
      debugPrint('page load event');
      pageLength = event.pageLength;
      emit(const IntroState(screenType: ScreenType.initialPage,pageIndex: 0));
    },);

    on<PageChangedEvent>((event, emit) {
      debugPrint('page changed event');
      if(event.index == 0){
        emit(IntroState(screenType: ScreenType.initialPage,pageIndex: event.index));
      }else if(event.index == pageLength - 1){
        emit(IntroState(screenType: ScreenType.finalPage,pageIndex: event.index));
      }else{
        emit(IntroState(screenType: ScreenType.intermediatePage,pageIndex: event.index));
      }
    },);
  }
}
