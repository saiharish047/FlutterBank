import 'package:bank/features/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum NavigationType {
  push,
  goBack,
  popUntil,
  replace,
  bottomsheet,
  replaceCurrent
}

abstract class INavigationManager {
  Future<dynamic> navigateTo({
    required String routeName,
    required NavigationType navigationType,
    Map<String, dynamic>? args,
  }) async {}
}

class NavigationManager extends INavigationManager{

  static var navigatorKey = GlobalKey<NavigatorState>();

  static final IRouteManager _routeManager = GlobalRouteManager();

  static Route getRoute(RouteSettings settings) {
    final view = _routeManager.getView(settings);
    return GetPageRoute(
      page: () => view,
      settings: settings,
    );
  }

  @override
  Future<dynamic> navigateTo({
    required String routeName,
    required NavigationType navigationType,
    Map<String, dynamic>? args,
  }) async {
    dynamic dynamicData;
    switch (navigationType) {
      case NavigationType.push:
        dynamicData = _push(routeName, args);
        break;
      case NavigationType.goBack:
        dynamicData = _pop(args);
        break;
      case NavigationType.popUntil:
        dynamicData = _popUntil(routeName, args);
        break;
      case NavigationType.replace:
        dynamicData = _replace(routeName, args);
        break;
      case NavigationType.bottomsheet:
        dynamicData = _bottomSheet(routeName, args);
        break;
      default:
        throw Exception(
          'Navigation type $navigationType does not exist',
        );
    }

    return dynamicData;
  }

  dynamic _push(String routeName, dynamic args) {
    return Get.toNamed(routeName, arguments: args);
  }

  dynamic _pop(dynamic args) {
    return Get.back(result: args);
  }

  dynamic _replace(String routeName, dynamic args) {
    var replaceNow = false;
    return Get.offNamedUntil(routeName, (route) {
          final prevReplaceNow = replaceNow;
          replaceNow = routeName == route.settings.name;
          return prevReplaceNow;
        }, arguments: args) ??
        Future.value();
  }

  dynamic _popUntil(String routeName, dynamic args) {
    return Get.until((route) => route.settings.name == routeName);
  }

  dynamic _bottomSheet(String routeName, dynamic args) {
    final dialogWidget = _routeManager.getBottomSheet(routeName, args);
    return Get.bottomSheet(
      dialogWidget,
      isScrollControlled: args['isScrollControlled'] as bool? ?? false,
      backgroundColor: args['backgroundColor'] as Color? ?? Colors.white,
      isDismissible: args['isDismissible'] as bool? ?? false,
      shape: args['shape'] as ShapeBorder?,
      enableDrag: args['enableDrag'] as bool? ?? false,
    );
  }
}

abstract class IRouteManager {
  Widget getView(RouteSettings settings);

  Widget getBottomSheet(String bottomSheetName, dynamic arguments) {
    throw Exception('bottomsheet $bottomSheetName not found');
  }
}
