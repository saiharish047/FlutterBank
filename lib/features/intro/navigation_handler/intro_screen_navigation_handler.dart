import 'package:bank/features/core/navigation_manager/navigation_manager.dart';
import 'package:bank/features/routes/routes.dart';

abstract class IIntroScreenNavigationHandler{
  void navigateToLoginPage();
}

class IntroScreenNavigationHandler extends IIntroScreenNavigationHandler{
  @override
  void navigateToLoginPage() {
    NavigationManager().navigateTo(routeName: GlobalRouteManager.loginView, navigationType: NavigationType.push);
  }

}