import 'package:bank/features/core/navigation_manager/navigation_manager.dart';
import 'package:bank/features/routes/routes.dart';

abstract class ILoginNavigationHandler {
  void navigateToSignUp();
}

class LoginNavigationHandler implements ILoginNavigationHandler {
  @override
  void navigateToSignUp() {
    NavigationManager().navigateTo(
      navigationType: NavigationType.push,
      routeName: GlobalRouteManager.signupView,
    );
  }
}
