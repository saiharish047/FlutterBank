import 'package:bank/features/core/extensions/list_extensions.dart';
import 'package:bank/features/intro/bloc/intro_bloc.dart';
import 'package:bank/features/intro/navigation_handler/intro_screen_navigation_handler.dart';
import 'package:bank/features/intro/widgets/button_widget.dart';
import 'package:bank/features/intro/widgets/indicator_widget.dart';
import 'package:bank/themes/color_palettes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class _Constants {
  static const images = [
    'assets/images/splash_1.png',
    'assets/images/splash_2.png',
    'assets/images/splash_3.png',
  ];
  static const double carousalHeight = 390;
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  CarouselController? _controller;
  int _current = 0;
  List<String> carouselContentTitleList = [];
  List<String> carouselContentDescriptionList = [];
  IIntroScreenNavigationHandler? navigationHandler;

  @override
  void initState() {
    _controller = CarouselController();
    final blocProvider = BlocProvider.of<IntroBloc>(context);
    navigationHandler = IntroScreenNavigationHandler();
    blocProvider.add(PageLoadEvent(pageLength: _Constants.images.length));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initializeContent();
    return Scaffold(
      body: BlocBuilder<IntroBloc, IntroState>(
        builder: (ctx, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: _pageView(ctx),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(child: _indicators()),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 40, left: 30, right: 30),
                  child: Align(child: _buttons(ctx)),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void _initializeContent() {
    if (carouselContentDescriptionList.isEmpty) {
      carouselContentDescriptionList = [
        AppLocalizations.of(context)?.introDescription0 ?? '',
        AppLocalizations.of(context)?.introDescription1 ?? '',
        AppLocalizations.of(context)?.introDescription2 ?? '',
      ];
    }
    if (carouselContentTitleList.isEmpty) {
      carouselContentTitleList = [
        AppLocalizations.of(context)?.introTitle0 ?? '',
        AppLocalizations.of(context)?.introTitle1 ?? '',
        AppLocalizations.of(context)?.introTitle2 ?? '',
      ];
    }
  }

  Widget _pageView(BuildContext context) {
    return CarouselSlider(
      carouselController: _controller,
      items: getImages(),
      options: CarouselOptions(
          enableInfiniteScroll: false,
          viewportFraction: 1,
          height: _Constants.carousalHeight,
          onPageChanged: ((index, reason) {
            context.read<IntroBloc>().add(PageChangedEvent(index: index));
            _current = index;
            setState(() {});
          })),
    );
  }

  List<Widget> getImages() {
    return _Constants.images
        .mapIndexed((e, i) => Column(
              children: [
                Image.asset(
                  e,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 42.0),
                  child: Text(
                    carouselContentTitleList[i],
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: ColorPalettes.colorC33C29),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    carouselContentDescriptionList[i],
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: ColorPalettes.colorC33C29),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ))
        .toList();
  }

  Widget _indicators() {
    return IndicatorWidget(
      currentIndex: _current,
      listData: _Constants.images,
    );
  }

  Widget _buttons(BuildContext ctx) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [getButtons(ctx)],
    );
  }

  Widget getButtons(BuildContext ctx) {
    final screenType = ctx.read<IntroBloc>().state.screenType;
    switch (screenType) {
      case ScreenType.finalPage:
        return _commonCta(ctx,
            onPressed: onSkipPressed,
            text: AppLocalizations.of(context)!.getStartedButtonLabel,
            containerColor: ColorPalettes.color75A29F,
            iconData: const Icon(
              Icons.arrow_forward_ios,
              color: (ColorPalettes.colorE4BE8F),
              size: 14,
            ));
      case ScreenType.intermediatePage:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _commonCta(ctx,
                onPressed: onBackPressed,
                iconData: const Icon(
                  Icons.arrow_back_ios,
                  color: (ColorPalettes.colorE4BE8F),
                  size: 14,
                )),
            _commonCta(ctx,
                onPressed: onNextPressed,
                containerColor: ColorPalettes.color75A29F,
                text: AppLocalizations.of(context)!.nextCtaLabel,
                iconData: const Icon(
                  Icons.arrow_forward_ios,
                  color: (ColorPalettes.colorE4BE8F),
                  size: 14,
                )),
          ],
        );

      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _skipCta(ctx, onSkipPressed),
            _commonCta(ctx,
                onPressed: onNextPressed,
                containerColor: ColorPalettes.color75A29F,
                text: AppLocalizations.of(context)!.nextCtaLabel,
                iconData: const Icon(
                  Icons.arrow_forward_ios,
                  color: (ColorPalettes.colorE4BE8F),
                  size: 14,
                )),
          ],
        );
    }
  }

  _skipCta(
    BuildContext context,
    Function(BuildContext context) onPressed,
  ) {
    return GestureDetector(
      onTap: () {
        onPressed.call(context);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            AppLocalizations.of(context)!.skipCtaLabel,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: ColorPalettes.color75A29F),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: ColorPalettes.colorE4BE8F,
            size: 16,
          ),
        ],
      ),
    );
  }

  _commonCta(
    BuildContext context, {
    String? text,
    String? icon,
    Icon? iconData,
    Color? containerColor,
    TextStyle? style,
    Function? onPressed,
  }) {
    return CommonButton(
      attributes: CommonButtonAttributes(
          onPressed: onPressed,
          text: text,
          icon: icon,
          iconData: iconData,
          containerColor: containerColor,
          style: style),
    );
  }

  onNextPressed(BuildContext context) {
    final state = context.read<IntroBloc>().state;
    _current = _current + 1;
    _controller?.animateToPage(state.pageIndex! + 1);
    context
        .read<IntroBloc>()
        .add(PageChangedEvent(index: state.pageIndex! + 1));
  }

  onBackPressed(BuildContext context) {
    final state = context.read<IntroBloc>().state;
    _current = _current - 1;
    _controller?.animateToPage(state.pageIndex! - 1);
    context
        .read<IntroBloc>()
        .add(PageChangedEvent(index: state.pageIndex! - 1));
  }

  onSkipPressed(BuildContext context) {
    navigationHandler?.navigateToLoginPage();
  }
}
