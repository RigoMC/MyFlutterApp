import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:primer_proyecto/models/model_onboarding.dart';
import 'package:primer_proyecto/responsive.dart';
import 'package:primer_proyecto/widgets/on_boarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();
  int currentPage = 0;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
            title: '¿Tienes una idea?',
            subtitle:
                'Acude con el equipo de incubación para poder dar un enfoque y desarrollar todo tu potencial',
            image: AssetImage("assets/onboarding1.png"),
            backgroundColor: Color.fromRGBO(11, 23, 7, 1),
            titleColor: Color.fromRGBO(229, 235, 210, 1),
            subtitleColor: Color.fromRGBO(229, 235, 210, 1),
            background: 'assets/animations/fireworks-explode.json')),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            title: 'Estrategias de administración de tiempo.',
            subtitle:
                'Acude al taller administración de tiempo para el estudio que se impartirá en la semana lince',
            image: AssetImage("assets/onboarding2.png"),
            backgroundColor: Color.fromRGBO(229, 235, 210, 1),
            titleColor: Color.fromRGBO(27, 32, 49, 1),
            subtitleColor: Color.fromRGBO(27, 32, 49, 1),
            background: 'assets/animations/sparkles-burst.json')),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            title: '¿Quieres conocer tu rumbo?',
            subtitle:
                'Descubre que camino tomar luego de culminar tu carrera con el taller Conoce tu rumbo.',
            image: AssetImage("assets/onboarding3.png"),
            backgroundColor: Color.fromRGBO(27, 32, 49, 1),
            titleColor: Color.fromRGBO(205, 209, 201, 1),
            subtitleColor: Color.fromRGBO(205, 209, 201, 1),
            background: 'assets/animations/white-bubbles.json'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        LiquidSwipe(
          pages: pages,
          onPageChangeCallback: OnPageChange,
          liquidController: controller,
          enableSideReveal: true,
          slideIconWidget: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: pages.length,
              effect: ExpandingDotsEffect(
                dotHeight: 12,
                dotWidth: 12,
                dotColor: Colors.black26,
                activeDotColor: Colors.black45,
              ),
            ),
          ),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width / 2 - 40,
            bottom: 50.0,
            child: OutlinedButton(
                onPressed: () {
                  int nextPage = controller.currentPage + 1;
                  controller.animateToPage(page: nextPage);
                },
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.black26),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    onPrimary: Colors.white),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_forward_ios),
                ))),
        Responsive(
            mobile: MobileScreenSkip(),
            tablet: TabletDesktopScreenSkip(),
            desktop: TabletDesktopScreenSkip())
      ],
    ));
  }

  void OnPageChange(int page) {
    setState(() {
      currentPage = page;
    });
  }
}

class MobileScreenSkip extends StatelessWidget {
  const MobileScreenSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50,
        left: 20,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/dash');
          },
          child: const Text('SKIP',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2.0,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        offset: Offset(1.0, 1.0))
                  ])),
        ));
  }
}

class TabletDesktopScreenSkip extends StatelessWidget {
  const TabletDesktopScreenSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50,
        right: 20,
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text('SKIP',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.black,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 2.0,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          offset: Offset(1.0, 1.0))
                    ]))));
  }
}
