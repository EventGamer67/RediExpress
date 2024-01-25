import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _pageChanged(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LimitedBox(
                maxHeight: MediaQuery.of(context).size.width,
                child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      _pageChanged(value);
                    },
                    children: [
                      SvgPicture.asset(
                        'assets/svg/1.svg',
                      ),
                      SvgPicture.asset(
                        'assets/svg/2.svg',
                      ),
                      SvgPicture.asset(
                        'assets/svg/3.svg',
                      )
                    ]),
              ),
              Column(
                children: [
                  SizedBox(height: 82,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 5, 95, 250),
                            borderRadius: BorderRadius.all(Radius.circular(9))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('Next',style: GoogleFonts.roboto(color: Colors.white) )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


