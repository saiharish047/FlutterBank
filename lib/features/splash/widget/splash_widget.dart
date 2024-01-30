import 'package:bank/features/core/navigation_manager/navigation_manager.dart';
import 'package:bank/features/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        NavigationManager().navigateTo(routeName: GlobalRouteManager.introView, navigationType: NavigationType.push);
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      'assets/animations/splash_animation.json',
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      controller: _controller,
      repeat: false,
      onLoaded: (composition) {
        _controller
          ?..duration = composition.duration
          ..forward();
      },
    );
  }
}


//! Bloc -> Presentation, all injections should be done here.

//! Pages will be our screen

//! widget to create small components

//