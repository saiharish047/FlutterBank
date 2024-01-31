import 'package:bank/features/core/navigation_manager/navigation_manager.dart';
import 'package:bank/features/intro/pages/intro_page.dart';
import 'package:bank/features/login/widget/login_widget.dart';
import 'package:bank/features/splash/widget/splash_widget.dart';
import 'package:flutter/widgets.dart';

class GlobalRouteManager extends IRouteManager{
  static const splashView = 'splashview';
  static const loginView = 'loginView';
  static const introView = 'introView';
  @override
  Widget getView(RouteSettings settings) {
    switch(settings.name){
      case splashView:
        return const SplashWidget();
      case loginView:        
        return const LoginScreenWidget();
      case introView:
        return const IntroScreen();
    }
    return Container();
  }

  @override
  Widget getBottomSheet(String bottomSheetName, arguments) {
    return Container();
  }

}