import 'package:bank/features/core/dependency_injection/global_modules.dart';
import 'package:bank/features/core/navigation_manager/navigation_manager.dart';
import 'package:bank/features/intro/bloc/intro_bloc.dart';
import 'package:bank/features/splash/widget/splash_widget.dart';
import 'package:bank/themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  registerDependencies();
  runApp(const MyApp());
}

void registerDependencies() {
  GlobalModules.registerDependencies();
}

List<BlocProvider> _registerBlocProviders(){
  return [
    BlocProvider<IntroBloc>(create: (context) => IntroBloc())
  ];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _registerBlocProviders(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextThemes().lightTheme
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en')
        ],
        navigatorKey: NavigationManager.navigatorKey,
        onGenerateRoute: NavigationManager.getRoute,
        title: 'Totally Real Bank',
        home: const SplashWidget(),
      ),
    );
  }
}
