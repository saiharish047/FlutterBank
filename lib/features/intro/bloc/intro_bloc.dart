import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

//bloc will contain all business logic, API calls

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  late int pageLength;
  IntroBloc() : super(const InitialIntroState()) {
    on<PageLoadEvent>(
      (event, emit) {
        debugPrint('page load event');
        pageLength = event.pageLength;
        emit(const InitialIntroState());
      },
    );

    on<PageChangedEvent>(
      (event, emit) {
        debugPrint('page changed event');
        if (event.index == 0) {
          emit(const InitialIntroState());
        } else if (event.index == pageLength - 1) {
          emit(FinalIntroState(newPageIndex: event.index));
        } else {
          emit(IntermediateIntroState(newPageIndex: event.index));
        }
      },
    );
  }
}
